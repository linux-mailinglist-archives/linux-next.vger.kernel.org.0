Return-Path: <linux-next+bounces-7582-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4055AB07684
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 15:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66655189AD7C
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 13:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB2A28CF5E;
	Wed, 16 Jul 2025 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="ExaBptvo"
X-Original-To: linux-next@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3721E1A254E;
	Wed, 16 Jul 2025 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752670853; cv=none; b=IDasWcfjpubXpDd/w/B1bRMCf4UG2eo7vLx3dHIeT17gGUHN9s7p/r0eVsq/GoTWi0GEtE9UpohVbVus/Ee4w0dA9nAXEA+7Wxcv3AmBXX5sZwNlb+QUyCpcuBzq2hgfMM2uAfNQsu4pxghFWOWoQfTAt/gFTimZqw71nN7/+tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752670853; c=relaxed/simple;
	bh=shyb1sJq2DnKDFlz3fQAPl11G80K973X7F4Kc118vLY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=lOshPvNmDp9AsGQdQQF6vQJWGEzavyLfh0+aDxNu4+sW+4E0m3hGM2KE0B2S8TS4JXcYGe4crsc3o0/WBxkmhN6F4McUZTxHv+AtVd/YZ+SprBIKEloXMK31XHDSk/g7z2crS0Pd7KRdMB/PlGoZCodOiNEaa5C2iG8yslEWvQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=ExaBptvo reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=b+O16EHi6+OgaieHCvV/ddJBsiec8Rf8oT5frpBM7cQ=; b=E
	xaBptvoz2Nbk4ELLdUSNbfC9rxgaB/LJNBJFDXj+MpEXanorr14wEijQ3MNTG/hw
	IT20nFOQu/htl6bsjRuLCCpmLV/UI0vI6J9XGAxXXVZe7AYTLrJlRHqfRf4bLpxH
	HcAM4cNoyKoVG7KOjgnguvK8BbFI8UBMGV9OtExP2Y=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-109 (Coremail) ; Wed, 16 Jul 2025 21:00:19 +0800
 (CST)
Date: Wed, 16 Jul 2025 21:00:19 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	"Intel Graphics" <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re:linux-next: build warning after merge of the drm-misc tree
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250716203115.6e02e50c@canb.auug.org.au>
References: <20250716203115.6e02e50c@canb.auug.org.au>
X-NTES-SC: AL_Qu2eAPqcv0Aq7yafYukfmkcVgOw9UcO5v/Qk3oZXOJF8jCPp9C0vUnNTMUnG6MWDDiCwnQiHWzVR6spgbahGYoQgOxQv46vnKE/sRjyZt5I8dg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <73ab4497.98ab.19813525561.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bSgvCgD3H_Jjondou30FAA--.40498W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBiMXmh3ljHqCwACsB
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIaSBhbGwsCgpBdCAyMDI1LTA3LTE2IDE4OjMxOjE1LCAiU3RlcGhlbiBSb3Rod2VsbCIgPHNm
ckBjYW5iLmF1dWcub3JnLmF1PiB3cm90ZToKPkhpIGFsbCwKPgo+QWZ0ZXIgbWVyZ2luZyB0aGUg
ZHJtLW1pc2MgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkIChodG1sZG9jcykKPnByb2R1
Y2VkIHRoaXMgd2FybmluZzoKPgo+ZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYzoxMjQyOiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Igc3RydWN0IG1lbWJlciAnY29ubmVjdG9yJyBu
b3QgZGVzY3JpYmVkIGluICdkcm1fYnJpZGdlX2RldGVjdCcKPgo+SW50cm9kdWNlZCBieSBjb21t
aXQKPgo+ICA1ZDE1NmE5YzNkNWUgKCJkcm0vYnJpZGdlOiBQYXNzIGRvd24gY29ubmVjdG9yIHRv
IGRybSBicmlkZ2UgZGV0ZWN0IGhvb2siKQoKT25jZSBhZ2FpbiwgSSBhcG9sb2dpemUuIEkgaGF2
ZSBzZW50IGEgcGF0Y2hbMF0gIHdoaWNoIEkgaG9wZSB3aWxsIGZpeCB0aGlzIGlzc3VlLgpXaGVu
IEkgcmFuICJtYWtlIGh0bWxkb2NzIiBsb2NhbGx5LCBJIGRpZG4ndCBzZWUgdGhpcyB3YXJuaW5n
LiBJJ20gbm90IHN1cmUgaWYgaXQncyBiZWNhdXNlIG15IG1ldGhvZCB3YXMgaW5jb3JyZWN0LgoK
ClswXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDI1MDcxNjEyNTYwMi4zMTY2
NTczLTEtYW5keXNocmtAMTYzLmNvbS9ULyN1CgoKPgo+LS0gCj5DaGVlcnMsCj5TdGVwaGVuIFJv
dGh3ZWxsCg==

