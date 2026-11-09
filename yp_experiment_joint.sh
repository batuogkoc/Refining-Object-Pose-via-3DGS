set -eo pipefail
# TRAIN_SETS=("yp_model_6_1_cropped" "yp_model_6_2_cropped" "yp_model_6_3_cropped" "yp_model_6_4_cropped" "yp_real_1_segmented_cropped" "yp_real_2_segmented_cropped" "yp_sim_1_cropped" "yp_sim_2_cropped")
TRAIN_SETS=("yp_real_2_segmented_cropped" "yp_sim_1_cropped" "yp_sim_2_cropped")
TEST_SETS=("yp_model_6_1_cropped" "yp_model_6_2_cropped" "yp_model_6_3_cropped" "yp_model_6_4_cropped" "yp_real_1_segmented_cropped" "yp_real_2_segmented_cropped" "yp_sim_1_cropped" "yp_sim_2_cropped")
OUT_DIR=output/joint_results/joint-$(date +"%Y%m%d_%H%M%S")
mkdir -p "${OUT_DIR}"

for train_set in "${TRAIN_SETS[@]}"; do
    for test_set in "${TEST_SETS[@]}"; do
        out_model_name="joint-${train_set}-${test_set}"
        echo "Running validation for train set: ${train_set} and test set: ${test_set}"
        bash yp_val.sh "${train_set}" "${test_set}" "${out_model_name}" 2>&1 | tee "${OUT_DIR}/${out_model_name}.log"
    done
done