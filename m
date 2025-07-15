Return-Path: <linux-next+bounces-7544-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73214B05145
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 07:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C19174A6C3A
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 05:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6387A2D1925;
	Tue, 15 Jul 2025 05:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="kNBO4YDm"
X-Original-To: linux-next@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE2017C77;
	Tue, 15 Jul 2025 05:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752558728; cv=none; b=Wm776lRxiteDHpHZ7kO7z3uRLBIZQUJuZF4oJGi/DuSmv/oYdZCCmJ4i/hG7wztykLSl/ZPPAskEj1ArnusVq0DDCe+TAJVhlZd83GksQheXnw+6Kj9spZwmnbYyplY5Ivi52gVELGMtasA4LGYkJJjVobpFhEhBI4E0z8CQxj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752558728; c=relaxed/simple;
	bh=eb/KQa3YKGDTAad837fpuxOsW9l7OItESt8zDjY24lo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JFacNU4XZmu+ac6c/+CGnConw3OKJ8e/wpXZYJLsl5vZFtzWmI6MTnZgo3DYwu0qVhw3MKQ/2qNYbn2TUNQzamFvcPmbGlvrNM3LmOXrRt7azFFwrw/AQZ5kbRflSGHPtKzTj5NcpBA65t4who8UB/mYn0v197hoLS8o+xIusk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=kNBO4YDm reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=22XIZECCUFyqmoV8TymxImRToLbKd/ayA0aH5a2Hz2E=; b=k
	NBO4YDmMcb5YBVkrX8l8m+EZ2hEdjl78+oMGcBSN0eh3fWJzWbSa33RyhzoFTqMJ
	uvTH9s9XsZ4pyJlq6hQvkb8hKF6pi0omk2OvCRKW6Q77xt+3zbU4nHjbC6CBMl8I
	Id4Cm3H9sDKCjpQzzI/XnGFirQQBExzb3eMv6OiGKs=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-109 (Coremail) ; Tue, 15 Jul 2025 13:51:32 +0800
 (CST)
Date: Tue, 15 Jul 2025 13:51:32 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	"Intel Graphics" <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re:linux-next: build failure after merge of the drm-misc tree
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250715135511.63774cdb@canb.auug.org.au>
References: <20250715135511.63774cdb@canb.auug.org.au>
X-NTES-SC: AL_Qu2eAPmet04i5CKYZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jCPp9C0vUnNTMUnG6MWDDiCwnQiHWzVR6spgbahGYoQgrYMJICSzYYTA0cmJ/S/Q6w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4d2f67f5.4ec9.1980ca36770.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bSgvCgD3H_Bk7HVo9CAEAA--.31937W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAWLXmh146HzAAABst
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIGFsbCwKCkF0IDIwMjUtMDctMTUgMTE6NTU6MTEsICJTdGVwaGVuIFJvdGh3ZWxsIiA8c2Zy
QGNhbmIuYXV1Zy5vcmcuYXU+IHdyb3RlOgo+SGkgYWxsLAo+Cj5BZnRlciBtZXJnaW5nIHRoZSBk
cm0tbWlzYyB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKHg4Nl82NAo+YWxsbW9kY29u
ZmlnKSBmYWlsZWQgbGlrZSB0aGlzOgo+Cj5kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21lZ2FjaGlw
cy1zdGRweHh4eC1nZS1iODUwdjMtZncuYzogSW4gZnVuY3Rpb24gJ2dlX2I4NTB2M19sdmRzX2Rl
dGVjdCc6Cj5kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21lZ2FjaGlwcy1zdGRweHh4eC1nZS1iODUw
djMtZncuYzoxNDU6MTY6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0byBmdW5jdGlvbiAnZ2Vf
Yjg1MHYzX2x2ZHNfYnJpZGdlX2RldGVjdCcKPiAgMTQ1IHwgICAgICAgICByZXR1cm4gZ2VfYjg1
MHYzX2x2ZHNfYnJpZGdlX2RldGVjdCgmZ2VfYjg1MHYzX2x2ZHNfcHRyLT5icmlkZ2UpOwo+ICAg
ICAgfCAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj5kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL21lZ2FjaGlwcy1zdGRweHh4eC1nZS1iODUwdjMtZncuYzoxMjQ6MTog
bm90ZTogZGVjbGFyZWQgaGVyZQo+ICAxMjQgfCBnZV9iODUwdjNfbHZkc19icmlkZ2VfZGV0ZWN0
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCj4gICAgICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPmRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvbWVnYWNoaXBzLXN0ZHB4eHh4LWdlLWI4NTB2My1mdy5jOjE0NjoxOiBlcnJvcjog
Y29udHJvbCByZWFjaGVzIGVuZCBvZiBub24tdm9pZCBmdW5jdGlvbiBbLVdlcnJvcj1yZXR1cm4t
dHlwZV0KPiAgMTQ2IHwgfQo+ICAgICAgfCBeCj4KPkNhdXNlZCBieSBjb21taXQKPgo+ICA1ZDE1
NmE5YzNkNWUgKCJkcm0vYnJpZGdlOiBQYXNzIGRvd24gY29ubmVjdG9yIHRvIGRybSBicmlkZ2Ug
ZGV0ZWN0IGhvb2siKQoKU29ycnkgZm9yIHRoaXMsIEkgaGF2ZSBzZW50IGEgZml4IGZvciB0aGlz
IGlzc3VlOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjUwNzE1MDU0NzU0
LjgwMDc2NS0xLWFuZHlzaHJrQDE2My5jb20vVC8jdQoKPgo+SSBoYXZlIHVzZWQgdGhlIGRybS1t
aXNjIHRyZWUgZnJvbSBuZXh0LTIwMjUwNzE0IGZvciB0b2RheS4KPgo+LS0gCj5DaGVlcnMsCj5T
dGVwaGVuIFJvdGh3ZWxsCg==

