function calc_price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    const calcFee = Math.floor(inputValue * 0.1)
    addTaxDom.innerHTML = calcFee
    const addProfit = document.getElementById("profit")
    addProfit.innerHTML = Math.floor(inputValue - calcFee )
  })

}

window.addEventListener('load', calc_price);