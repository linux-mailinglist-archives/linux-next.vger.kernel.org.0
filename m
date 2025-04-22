Return-Path: <linux-next+bounces-6337-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11A9A97800
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 22:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9140A3B9B05
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 20:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BBB2DAF6A;
	Tue, 22 Apr 2025 20:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DQRkJ5mU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22932C2AC1
	for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 20:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745355004; cv=none; b=kbcLir76OtLsGfwTUicEfNFFF9yYY/pd9wKqXGldu+CYFsXo7NlaET0nyiNRpik2kf/KKTr87QX4NrZfdUFLTeBgYiTGN1jiecex8XiXu9FTcgfCRH4pVGIE6d8g5xwBenI+PMnpbS2lpTRs97y9n5XdHQIMKIDb8vGMPgg0wII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745355004; c=relaxed/simple;
	bh=tq11VXuGK4G076cwsssULAGWFP4LI4Ru1bEvQpkX+Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UckiaUSlQbR2w0sBpG2HT+eQ8MO/AUNGyRjlncUf5NRxXJ8DAdRM0A+xJ8g9+yQGpJh6CYxqsxxu3tQ5qiBRWfI6DGrDevZ4IQy5EvGfMB5sLrLO44/ZZD4ahQPkcdeapE2QDN3CRMI7DJGpx209fXwvCPLo75bdyv77g7vGlKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DQRkJ5mU; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac25520a289so745333866b.3
        for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 13:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745354999; x=1745959799; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4FWTDkomkXSOBV/XGBWUMIf5NiQnIJYvdg+R5LOeElQ=;
        b=DQRkJ5mU5C18CXBNovdfK5rkzfzHQIkPZ13YbUOqoZRfqm3GQAtmlH0fO7WOh+3aXW
         ZDB7RAn9roH03MYk7YMTsIt7/O1kXJGetH4BKXEC+BqJa64x4M0GzO0Ju8ocOPGkeoHr
         nQ2wPj++bM/zxNiFfWV2es+LJJXi8xUIKj/L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745354999; x=1745959799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FWTDkomkXSOBV/XGBWUMIf5NiQnIJYvdg+R5LOeElQ=;
        b=HcFqUNcfQEnH1zT/g5nVzzCYcFRQHzrWUJOUrAobk9DOKWzoHnY0d9Apu1eVqDH5LF
         t7GACLylDHJSJ9gc6aMyNuJ7Ki3dVLtEunXHWVtO9LzQ2fqq+tTizi0d9NCQNurQ2WCy
         Wsat0/v7g69NhF0gNiTqjnR2qk4fjK9A0Z+1Ms23/262oh9AITQj/bLHbZ+45vLWBRGo
         B6AIQskPP3gGiHWbbv7TtYe8MlSG9RYAIJViOH2jIc7n4EHLJNLEyhzAkkHJinKkPd6B
         MEV9IrtxqhRE3Nh+S1Jycxm0hsthPYDLqQRLbRkFBTJZ3KdwAcu9xv6qd9oxmaPYzfec
         4Ldw==
X-Forwarded-Encrypted: i=1; AJvYcCVFZRVNNlIqTkSa7HhMkdO3eX8VfhDmbvbVlxF7AJO656FZW4gWrzgok4PpqzBlTkvnOkK4WNkOh37n@vger.kernel.org
X-Gm-Message-State: AOJu0YyvNs7R5olzemZBCPE629GlEpReIV/k4o/wNFz8bmGdVCepXj+z
	BF/4RzCdWtK3LsGt88BUxEuEd1Rx7SNQ78Q+fWva7pWp74mxouGFGzkLVvegnunayOC1VldYy/T
	gaS0=
X-Gm-Gg: ASbGnctdMJ+O/uHhfz1BjhASmGvnpmkZgff8g6b5nh1tpeNjTUOw0r+j4h/m4QTbLsA
	6XJ31OBFSDymgIITUOquapx8HWBzijpAA+Qd0KFp3UADqkaSnYVTFu8s1N0/9oEZ7SCz5udI3BP
	4pE7IQveGu1hAO/cdkeHee+a2+9a9VUdbvuDmD8LXiPeuTWVKvzVBz2DDkHLzRKY4jRs9bE/r01
	9UmZea8jb7gNZDBl8hLt4OaggcTQZ5Nu6kCdU1k5b7A47VVuwDMP3e4ygGYb7eRhh3zIiqrJHaW
	l9N7J325voKBPHkZ3sn/3taWHBGKgaK+sXz7oVMUhRLk6INhwuB01RdToYqciEJnXrwCwQhWYrX
	3WF7nDSve2zN10nII3xS78Adovw==
X-Google-Smtp-Source: AGHT+IHqWINVXzjP/DXXMB8M/Y7lUK/qZCLfyBPDlsmh39xlQ+SPI7huct0P6Mxsgq7L4JWZpuYpiQ==
X-Received: by 2002:a17:907:972a:b0:aca:d861:877b with SMTP id a640c23a62f3a-acb74dda76amr1254539866b.49.1745354998737;
        Tue, 22 Apr 2025 13:49:58 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4f6c8sm714609666b.64.2025.04.22.13.49.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 13:49:57 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acae7e7587dso758872566b.2
        for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 13:49:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJKoHHEuYekNtb+EMPE/wQPvCdOlf06AGT5AUqiRQuWoaPerySeKis14pNHqkf/gLLIdZVUy0k7PH/@vger.kernel.org
X-Received: by 2002:a17:907:743:b0:aca:cac7:28e2 with SMTP id
 a640c23a62f3a-acb74d8310bmr1556140366b.40.1745354996549; Tue, 22 Apr 2025
 13:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422204718.0b4e3f81@canb.auug.org.au> <CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
 <54c5930c-4006-4af9-8870-5d887bae7ac1@t-8ch.de> <CAHk-=whv79F+zTKPa3yygTWnC+z9gRtPOdj_aBegWXtWB3D9=A@mail.gmail.com>
In-Reply-To: <CAHk-=whv79F+zTKPa3yygTWnC+z9gRtPOdj_aBegWXtWB3D9=A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Apr 2025 13:49:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiWeE8jU9d_aMbeczuDxWzkoks38ALLfv44xSiiv7DQyA@mail.gmail.com>
X-Gm-Features: ATxdqUGHYynWmKNIpL2uvXGI5h4GrqDjj-l3DfiA1avpodNwGhrFkOwAVinoFoY
Message-ID: <CAHk-=wiWeE8jU9d_aMbeczuDxWzkoks38ALLfv44xSiiv7DQyA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of Linus' tree
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/mixed; boundary="00000000000093d845063364203d"

--00000000000093d845063364203d
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 11:20, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Heh. We have several other cases of that "disable warning" pattern
> that does *not* use that cc-disable-warning thing.

Bah. I did the obvious sed-script to fix this up, and the result just
feels oh-so-wrong.

It feels so wrong because the CC_NO_STRINGOP_OVERFLOW case in the main
Makefile goes from having

 ... += $(call cc-option, -Wno-stringop-overflow)

to having the (obviously fixed)

 ... += $(call cc-disable-warning, stringop-overflow)

and the patch is clearly *right*.

But the "feels wrong" part is because the very next  (unchanged) line
in the patch is then using

 ... += $(call cc-option, -Wstringop-overflow)

for the CC_STRINGOP_OVERFLOW case.

So that patch (full patch attached if somebody wants to see it) really
makes it obvious just how unbalanced that cc-option vs
cc-disable-warning thing is.

No wonder we had this pattern wrong in several places, in other words.

              Linus

--00000000000093d845063364203d
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m9sz8ut00>
X-Attachment-Id: f_m9sz8ut00

IE1ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQogYXJjaC9sb29uZ2FyY2gv
a2VybmVsL01ha2VmaWxlIHwgOCArKysrLS0tLQogYXJjaC9sb29uZ2FyY2gva3ZtL01ha2VmaWxl
ICAgIHwgMiArLQogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgIHwgNCArKy0tCiA0IGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IGU5NGJiYjIyOThjOC4uMDdmODE4MTg2MTUxIDEw
MDY0NAotLS0gYS9NYWtlZmlsZQorKysgYi9NYWtlZmlsZQpAQCAtMTA1MywxMSArMTA1MywxMSBA
QCBOT1NURElOQ19GTEFHUyArPSAtbm9zdGRpbmMKIEtCVUlMRF9DRkxBR1MgKz0gJChjYWxsIGNj
LW9wdGlvbiwgLWZzdHJpY3QtZmxleC1hcnJheXM9MykKIAogI0N1cnJlbnRseSwgZGlzYWJsZSAt
V3N0cmluZ29wLW92ZXJmbG93IGZvciBHQ0MgMTEsIGdsb2JhbGx5LgotS0JVSUxEX0NGTEFHUy0k
KENPTkZJR19DQ19OT19TVFJJTkdPUF9PVkVSRkxPVykgKz0gJChjYWxsIGNjLW9wdGlvbiwgLVdu
by1zdHJpbmdvcC1vdmVyZmxvdykKK0tCVUlMRF9DRkxBR1MtJChDT05GSUdfQ0NfTk9fU1RSSU5H
T1BfT1ZFUkZMT1cpICs9ICQoY2FsbCBjYy1kaXNhYmxlLXdhcm5pbmcsIHN0cmluZ29wLW92ZXJm
bG93KQogS0JVSUxEX0NGTEFHUy0kKENPTkZJR19DQ19TVFJJTkdPUF9PVkVSRkxPVykgKz0gJChj
YWxsIGNjLW9wdGlvbiwgLVdzdHJpbmdvcC1vdmVyZmxvdykKIAogI0N1cnJlbnRseSwgZGlzYWJs
ZSAtV3VudGVybWluYXRlZC1zdHJpbmctaW5pdGlhbGl6YXRpb24gYXMgYnJva2VuCi1LQlVJTERf
Q0ZMQUdTICs9ICQoY2FsbCBjYy1vcHRpb24sIC1Xbm8tdW50ZXJtaW5hdGVkLXN0cmluZy1pbml0
aWFsaXphdGlvbikKK0tCVUlMRF9DRkxBR1MgKz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZywg
dW50ZXJtaW5hdGVkLXN0cmluZy1pbml0aWFsaXphdGlvbikKIAogIyBkaXNhYmxlIGludmFsaWQg
ImNhbid0IHdyYXAiIG9wdGltaXphdGlvbnMgZm9yIHNpZ25lZCAvIHBvaW50ZXJzCiBLQlVJTERf
Q0ZMQUdTCSs9IC1mbm8tc3RyaWN0LW92ZXJmbG93CmRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJj
aC9rZXJuZWwvTWFrZWZpbGUgYi9hcmNoL2xvb25nYXJjaC9rZXJuZWwvTWFrZWZpbGUKaW5kZXgg
NDg1M2U4YjA0YzZmLi44NGIxZDhiMzZhNDcgMTAwNjQ0Ci0tLSBhL2FyY2gvbG9vbmdhcmNoL2tl
cm5lbC9NYWtlZmlsZQorKysgYi9hcmNoL2xvb25nYXJjaC9rZXJuZWwvTWFrZWZpbGUKQEAgLTIx
LDEwICsyMSwxMCBAQCBvYmotJChDT05GSUdfQ1BVX0hBU19MQlQpCSs9IGxidC5vCiAKIG9iai0k
KENPTkZJR19BUkNIX1NUUklDVF9BTElHTikJKz0gdW5hbGlnbmVkLm8KIAotQ0ZMQUdTX21vZHVs
ZS5vCQkrPSAkKGNhbGwgY2Mtb3B0aW9uLC1Xbm8tb3ZlcnJpZGUtaW5pdCwpCi1DRkxBR1Nfc3lz
Y2FsbC5vCSs9ICQoY2FsbCBjYy1vcHRpb24sLVduby1vdmVycmlkZS1pbml0LCkKLUNGTEFHU190
cmFwcy5vCQkrPSAkKGNhbGwgY2Mtb3B0aW9uLC1Xbm8tb3ZlcnJpZGUtaW5pdCwpCi1DRkxBR1Nf
cGVyZl9ldmVudC5vCSs9ICQoY2FsbCBjYy1vcHRpb24sLVduby1vdmVycmlkZS1pbml0LCkKK0NG
TEFHU19tb2R1bGUubwkJKz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZyxvdmVycmlkZS1pbml0
LCkKK0NGTEFHU19zeXNjYWxsLm8JKz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZyxvdmVycmlk
ZS1pbml0LCkKK0NGTEFHU190cmFwcy5vCQkrPSAkKGNhbGwgY2MtZGlzYWJsZS13YXJuaW5nLG92
ZXJyaWRlLWluaXQsKQorQ0ZMQUdTX3BlcmZfZXZlbnQubwkrPSAkKGNhbGwgY2MtZGlzYWJsZS13
YXJuaW5nLG92ZXJyaWRlLWluaXQsKQogCiBpZmRlZiBDT05GSUdfRlVOQ1RJT05fVFJBQ0VSCiAg
IGlmbmRlZiBDT05GSUdfRFlOQU1JQ19GVFJBQ0UKZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNo
L2t2bS9NYWtlZmlsZSBiL2FyY2gvbG9vbmdhcmNoL2t2bS9NYWtlZmlsZQppbmRleCBmNGM4ZTM1
YzIxNmEuLmUzZjAyMjU2MDJmZiAxMDA2NDQKLS0tIGEvYXJjaC9sb29uZ2FyY2gva3ZtL01ha2Vm
aWxlCisrKyBiL2FyY2gvbG9vbmdhcmNoL2t2bS9NYWtlZmlsZQpAQCAtMjEsNCArMjEsNCBAQCBr
dm0teSArPSBpbnRjL2Vpb2ludGMubwoga3ZtLXkgKz0gaW50Yy9wY2hfcGljLm8KIGt2bS15ICs9
IGlycWZkLm8KIAotQ0ZMQUdTX2V4aXQubwkrPSAkKGNhbGwgY2Mtb3B0aW9uLC1Xbm8tb3ZlcnJp
ZGUtaW5pdCwpCitDRkxBR1NfZXhpdC5vCSs9ICQoY2FsbCBjYy1kaXNhYmxlLXdhcm5pbmcsb3Zl
cnJpZGUtaW5pdCwpCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSBiL2Fy
Y2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCmluZGV4IDhkMTg2YmZjZWQ0NS4uYzZmOWI0MTkzNTlj
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQorKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9NYWtlZmlsZQpAQCAtOSw4ICs5LDggQEAgQ0ZMQUdTX1JFTU9WRV9wYXRjaC5vCT0g
JChDQ19GTEFHU19GVFJBQ0UpCiBDRkxBR1NfUkVNT1ZFX3NiaS5vCT0gJChDQ19GTEFHU19GVFJB
Q0UpCiBDRkxBR1NfUkVNT1ZFX3JldHVybl9hZGRyZXNzLm8JPSAkKENDX0ZMQUdTX0ZUUkFDRSkK
IGVuZGlmCi1DRkxBR1Nfc3lzY2FsbF90YWJsZS5vCSs9ICQoY2FsbCBjYy1vcHRpb24sLVduby1v
dmVycmlkZS1pbml0LCkKLUNGTEFHU19jb21wYXRfc3lzY2FsbF90YWJsZS5vICs9ICQoY2FsbCBj
Yy1vcHRpb24sLVduby1vdmVycmlkZS1pbml0LCkKK0NGTEFHU19zeXNjYWxsX3RhYmxlLm8JKz0g
JChjYWxsIGNjLWRpc2FibGUtd2FybmluZyxvdmVycmlkZS1pbml0LCkKK0NGTEFHU19jb21wYXRf
c3lzY2FsbF90YWJsZS5vICs9ICQoY2FsbCBjYy1kaXNhYmxlLXdhcm5pbmcsb3ZlcnJpZGUtaW5p
dCwpCiAKIGlmZGVmIENPTkZJR19LRVhFQ19DT1JFCiBBRkxBR1Nfa2V4ZWNfcmVsb2NhdGUubyA6
PSAtbWNtb2RlbD1tZWRhbnkgJChjYWxsIGNjLW9wdGlvbiwtbW5vLXJlbGF4KQo=
--00000000000093d845063364203d--

