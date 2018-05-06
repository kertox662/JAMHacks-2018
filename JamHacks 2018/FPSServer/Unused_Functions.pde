boolean isArrayEmpty(float[] array) {
    int numsTrue = 0;
    for (int j = 0; j < array.length; j++) {
        if (array[j] == 0) {
            numsTrue++;
        }
    }
    if (numsTrue == array.length) {
        return true;
    }
    return false;
}
