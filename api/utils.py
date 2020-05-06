from typing import Any
from hexbytes import HexBytes
from web3.datastructures import AttributeDict


def serialize_hexbytes(obj: Any) -> Any:
    return obj.hex() if isinstance(obj, HexBytes) else obj


def serialize_receipt(receipt: AttributeDict) -> dict:
    return {k: serialize_hexbytes(v) for k, v in receipt.items()}
