Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644742235EC
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 09:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgGQHbb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 03:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgGQHba (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 03:31:30 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632CFC061755;
        Fri, 17 Jul 2020 00:31:30 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id l23so139653qkk.0;
        Fri, 17 Jul 2020 00:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vq/MCEaLDMDqNB59nI917ng8XcSbXSzX90eaXV2DpJU=;
        b=usGsSzS08m5C5AxVU/aGJopD5Vyc2Yx/Mff+iNWBLBXiD1hkxvBVUEN4uQOmqdU9Ga
         8KFSShw7fF9S6UTwlTl+a9vHmzNUT4Klk2qE2MEexn5k5obWQsul8Q/aphZU16qoZ2Kh
         v/lqfBKEeR4Y+oY3SjYHiaI1/nzdhfIsy5Bz+FNsyScB/NW0VOwPiG8LDoeBbIz3DX0f
         4Rwyew3qSEkl5wAyvdHjMSaUBUXOzq1wWR0LYMkxoingL1mUKZq4H7Wno8H9z2qGU7H0
         SMb3biWmdYzq6mNGwHMi87Chfhb6uUVuLvw+HBP4q+p5+Zj/X7jZC83qO5vlBSm32t8t
         EHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vq/MCEaLDMDqNB59nI917ng8XcSbXSzX90eaXV2DpJU=;
        b=hRzvwQGcrLAx9rZM16SiMEcY0ONr8M+es5KlG5WlWJjXOCrIpPGvU7L0R4TssDSJoL
         SZssKP7GkOEMvt0/MCxm4N3nAyDDgOFv+TYMAZJiv/8E1i6wbi4SHea+DJz1y3BsCNqp
         163yX/k4lF3UPhIQ+9+mlTGWYa5u7pmeM7nFk59XEd/rLJz4kR000zq0gsGr94RYgOzm
         //Cp0xoD80lOPNiuviViR+ji+BBG9HtFwJF5hGPJE96dCAeOk+qwkhbXt421MvUKfVdp
         zjLOQL8+zUa5F9QRgQs/LDh1wMsG3cwhPWzmzbY6sBI1IgqiUgETQT/Tzw7qH9z5AAeq
         IuQg==
X-Gm-Message-State: AOAM532DZwSRrIP+0UESfyfla48WeXI3+lBA7dHTW4pkSRcwhXgbnipB
        4oWN64h2I+sBfgf8PzbrYqKaEtYwcsKy0PDmBr8=
X-Google-Smtp-Source: ABdhPJwfkxIVOtKA3cqACXX8TcP92PpVg/229vALyj3mGuinOCb5bcnig4y4ziPK9PqeU08fw5qpbDm+tVJJHCWyT5A=
X-Received: by 2002:a37:73c3:: with SMTP id o186mr7335880qkc.465.1594971089315;
 Fri, 17 Jul 2020 00:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200717144656.4bdbf81f@canb.auug.org.au> <CAFULd4Ye2d-8BY7aY+_2tYwcXsfSCe3O6aJ4LF0KhvWTjVt0rA@mail.gmail.com>
 <20200717064401.GB2504@gondor.apana.org.au>
In-Reply-To: <20200717064401.GB2504@gondor.apana.org.au>
From:   Uros Bizjak <ubizjak@gmail.com>
Date:   Fri, 17 Jul 2020 09:31:18 +0200
Message-ID: <CAFULd4b9O+KJKwjQTB1PTuxMEDSDMov0rQaE85+9pfRrd02dKw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Sasha Levin <sashal@kernel.org>
Content-Type: multipart/mixed; boundary="00000000000034c6c405aa9e2505"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--00000000000034c6c405aa9e2505
Content-Type: text/plain; charset="UTF-8"

Please find attached the incremental patch that puts back integer
parts of inst.h. This resolves the conflict with the tip tree.

Uros.

On Fri, Jul 17, 2020 at 8:45 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Fri, Jul 17, 2020 at 08:27:27AM +0200, Uros Bizjak wrote:
> >
> > I will prepare a v2 that leaves needed part of inst.h.
>
> Your patch has already been applied.  So please make it an
> incremental patch.
>
> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--00000000000034c6c405aa9e2505
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-crypto-x86-Put-back-integer-parts-of-include-asm-ins.patch"
Content-Disposition: attachment; 
	filename="0001-crypto-x86-Put-back-integer-parts-of-include-asm-ins.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kcpwl5s60>
X-Attachment-Id: f_kcpwl5s60

RnJvbSAyYWVkNmQ1YWM0YjU2MTA5MzkyMWZmYjBkMWU0YTMxZDlhZDE1ZDlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcm9zIEJpemphayA8dWJpempha0BnbWFpbC5jb20+CkRhdGU6
IEZyaSwgMTcgSnVsIDIwMjAgMDk6MjQ6NTMgKzAyMDAKU3ViamVjdDogW1BBVENIXSBjcnlwdG86
IHg4NiAtIFB1dCBiYWNrIGludGVnZXIgcGFydHMgb2YgaW5jbHVkZS9hc20vaW5zdC5oCgpSZXNv
bHZlcyBjb25mbGljdCB3aXRoIHRoZSB0aXAgdHJlZS4KClNpZ25lZC1vZmYtYnk6IFVyb3MgQml6
amFrIDx1Yml6amFrQGdtYWlsLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnN0Lmgg
fCAxNDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTQ4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3g4Ni9pbmNsdWRl
L2FzbS9pbnN0LmgKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnN0LmggYi9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnN0LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi40MzhjY2Q0ZjNjYzQKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9pbnN0LmgKQEAgLTAsMCArMSwxNDggQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wICovCisvKgorICogR2VuZXJhdGUgLmJ5dGUgY29kZSBmb3Igc29tZSBpbnN0
cnVjdGlvbnMgbm90IHN1cHBvcnRlZCBieSBvbGQKKyAqIGJpbnV0aWxzLgorICovCisjaWZuZGVm
IFg4Nl9BU01fSU5TVF9ICisjZGVmaW5lIFg4Nl9BU01fSU5TVF9ICisKKyNpZmRlZiBfX0FTU0VN
QkxZX18KKworI2RlZmluZSBSRUdfTlVNX0lOVkFMSUQJCTEwMAorCisjZGVmaW5lIFJFR19UWVBF
X1IzMgkJMAorI2RlZmluZSBSRUdfVFlQRV9SNjQJCTEKKyNkZWZpbmUgUkVHX1RZUEVfSU5WQUxJ
RAkxMDAKKworCS5tYWNybyBSMzJfTlVNIG9wZCByMzIKKwlcb3BkID0gUkVHX05VTV9JTlZBTElE
CisJLmlmYyBccjMyLCVlYXgKKwlcb3BkID0gMAorCS5lbmRpZgorCS5pZmMgXHIzMiwlZWN4CisJ
XG9wZCA9IDEKKwkuZW5kaWYKKwkuaWZjIFxyMzIsJWVkeAorCVxvcGQgPSAyCisJLmVuZGlmCisJ
LmlmYyBccjMyLCVlYngKKwlcb3BkID0gMworCS5lbmRpZgorCS5pZmMgXHIzMiwlZXNwCisJXG9w
ZCA9IDQKKwkuZW5kaWYKKwkuaWZjIFxyMzIsJWVicAorCVxvcGQgPSA1CisJLmVuZGlmCisJLmlm
YyBccjMyLCVlc2kKKwlcb3BkID0gNgorCS5lbmRpZgorCS5pZmMgXHIzMiwlZWRpCisJXG9wZCA9
IDcKKwkuZW5kaWYKKyNpZmRlZiBDT05GSUdfWDg2XzY0CisJLmlmYyBccjMyLCVyOGQKKwlcb3Bk
ID0gOAorCS5lbmRpZgorCS5pZmMgXHIzMiwlcjlkCisJXG9wZCA9IDkKKwkuZW5kaWYKKwkuaWZj
IFxyMzIsJXIxMGQKKwlcb3BkID0gMTAKKwkuZW5kaWYKKwkuaWZjIFxyMzIsJXIxMWQKKwlcb3Bk
ID0gMTEKKwkuZW5kaWYKKwkuaWZjIFxyMzIsJXIxMmQKKwlcb3BkID0gMTIKKwkuZW5kaWYKKwku
aWZjIFxyMzIsJXIxM2QKKwlcb3BkID0gMTMKKwkuZW5kaWYKKwkuaWZjIFxyMzIsJXIxNGQKKwlc
b3BkID0gMTQKKwkuZW5kaWYKKwkuaWZjIFxyMzIsJXIxNWQKKwlcb3BkID0gMTUKKwkuZW5kaWYK
KyNlbmRpZgorCS5lbmRtCisKKwkubWFjcm8gUjY0X05VTSBvcGQgcjY0CisJXG9wZCA9IFJFR19O
VU1fSU5WQUxJRAorI2lmZGVmIENPTkZJR19YODZfNjQKKwkuaWZjIFxyNjQsJXJheAorCVxvcGQg
PSAwCisJLmVuZGlmCisJLmlmYyBccjY0LCVyY3gKKwlcb3BkID0gMQorCS5lbmRpZgorCS5pZmMg
XHI2NCwlcmR4CisJXG9wZCA9IDIKKwkuZW5kaWYKKwkuaWZjIFxyNjQsJXJieAorCVxvcGQgPSAz
CisJLmVuZGlmCisJLmlmYyBccjY0LCVyc3AKKwlcb3BkID0gNAorCS5lbmRpZgorCS5pZmMgXHI2
NCwlcmJwCisJXG9wZCA9IDUKKwkuZW5kaWYKKwkuaWZjIFxyNjQsJXJzaQorCVxvcGQgPSA2CisJ
LmVuZGlmCisJLmlmYyBccjY0LCVyZGkKKwlcb3BkID0gNworCS5lbmRpZgorCS5pZmMgXHI2NCwl
cjgKKwlcb3BkID0gOAorCS5lbmRpZgorCS5pZmMgXHI2NCwlcjkKKwlcb3BkID0gOQorCS5lbmRp
ZgorCS5pZmMgXHI2NCwlcjEwCisJXG9wZCA9IDEwCisJLmVuZGlmCisJLmlmYyBccjY0LCVyMTEK
Kwlcb3BkID0gMTEKKwkuZW5kaWYKKwkuaWZjIFxyNjQsJXIxMgorCVxvcGQgPSAxMgorCS5lbmRp
ZgorCS5pZmMgXHI2NCwlcjEzCisJXG9wZCA9IDEzCisJLmVuZGlmCisJLmlmYyBccjY0LCVyMTQK
Kwlcb3BkID0gMTQKKwkuZW5kaWYKKwkuaWZjIFxyNjQsJXIxNQorCVxvcGQgPSAxNQorCS5lbmRp
ZgorI2VuZGlmCisJLmVuZG0KKworCS5tYWNybyBSRUdfVFlQRSB0eXBlIHJlZworCVIzMl9OVU0g
cmVnX3R5cGVfcjMyIFxyZWcKKwlSNjRfTlVNIHJlZ190eXBlX3I2NCBccmVnCisJLmlmIHJlZ190
eXBlX3I2NCA8PiBSRUdfTlVNX0lOVkFMSUQKKwlcdHlwZSA9IFJFR19UWVBFX1I2NAorCS5lbHNl
aWYgcmVnX3R5cGVfcjMyIDw+IFJFR19OVU1fSU5WQUxJRAorCVx0eXBlID0gUkVHX1RZUEVfUjMy
CisJLmVsc2UKKwlcdHlwZSA9IFJFR19UWVBFX0lOVkFMSUQKKwkuZW5kaWYKKwkuZW5kbQorCisJ
Lm1hY3JvIFBGWF9SRVggb3BkMSBvcGQyIFc9MAorCS5pZiAoKFxvcGQxIHwgXG9wZDIpICYgOCkg
fHwgXFcKKwkuYnl0ZSAweDQwIHwgKChcb3BkMSAmIDgpID4+IDMpIHwgKChcb3BkMiAmIDgpID4+
IDEpIHwgKFxXIDw8IDMpCisJLmVuZGlmCisJLmVuZG0KKworCS5tYWNybyBNT0RSTSBtb2Qgb3Bk
MSBvcGQyCisJLmJ5dGUgXG1vZCB8IChcb3BkMSAmIDcpIHwgKChcb3BkMiAmIDcpIDw8IDMpCisJ
LmVuZG0KKyNlbmRpZgorCisjZW5kaWYKLS0gCjIuMjYuMgoK
--00000000000034c6c405aa9e2505--
