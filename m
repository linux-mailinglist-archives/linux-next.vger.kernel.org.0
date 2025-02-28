Return-Path: <linux-next+bounces-5611-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4DBA4968E
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 11:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E93577AB262
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 10:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F69425E442;
	Fri, 28 Feb 2025 10:05:03 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C7925DD17;
	Fri, 28 Feb 2025 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740737103; cv=none; b=KB5DAOfq612A31/r2g+mruM5FHQJMJ2a6YgroDDRJKxrXidmnLjX/pWAOHeJ7NKdyYTyRD1xlqHj4ZFo1tWD8NyKmbOmsOU69qYeATzeyudL6ipljDpmNzkHGr1wX7VjW6wRqctLaTM/T0zdub51VBJTxhY6eU8jyLgWUAtikv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740737103; c=relaxed/simple;
	bh=nJDdPV77EaQm16RzvcSDVLo4MgMMLLHpctE4qRjcAXU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QLodCtiTGIoBDsdBe/Mvx7oCwi7mDsXz+876go33owv3rw1m7YuzTw/+FMdfNEp2rZUvqmueRsmG0yNlzG9obvEF4FhAVRMVdhOqU8FXoXu7UlOlBSRBCAQJN9VewlnzhT7xBz3rJNltABr9rxPjn3auUXEXp7VLTbfgRlldQgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z43f83ccqz6M4Ml;
	Fri, 28 Feb 2025 18:02:08 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id EA43E140A35;
	Fri, 28 Feb 2025 18:04:57 +0800 (CST)
Received: from frapeml500007.china.huawei.com (7.182.85.172) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Feb 2025 11:04:57 +0100
Received: from frapeml500007.china.huawei.com ([7.182.85.172]) by
 frapeml500007.china.huawei.com ([7.182.85.172]) with mapi id 15.01.2507.039;
 Fri, 28 Feb 2025 11:04:57 +0100
From: Shiju Jose <shiju.jose@huawei.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab
	<mchehab+samsung@kernel.org>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the edac tree
Thread-Topic: linux-next: build warning after merge of the edac tree
Thread-Index: AQHbibWQCX91qZEQwUaDSgjPpJhSnbNcfB9A
Date: Fri, 28 Feb 2025 10:04:57 +0000
Message-ID: <af3e1e183b034ea89ed6582a5382e5c3@huawei.com>
References: <20250228185102.15842f8b@canb.auug.org.au>
In-Reply-To: <20250228185102.15842f8b@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

>-----Original Message-----
>From: Stephen Rothwell <sfr@canb.auug.org.au>
>Sent: 28 February 2025 07:51
>To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>; Borislav Petkov
><bp@alien8.de>; Tony Luck <tony.luck@intel.com>
>Cc: Jonathan Cameron <jonathan.cameron@huawei.com>; Shiju Jose
><shiju.jose@huawei.com>; Linux Kernel Mailing List <linux-
>kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.o=
rg>
>Subject: linux-next: build warning after merge of the edac tree
>
>Hi all,
>
>After merging the edac tree, today's linux-next build (htmldocs) produced =
this
>warning:
>
>Documentation/edac/index.rst: WARNING: document isn't included in any
>toctree
>
>Introduced by commit
>
>  db99ea5f2c03 ("EDAC: Add support for EDAC device features control")

Thanks Stephen for reporting this warning.

Hi All,

Following change fix this warning.

diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-api=
s.rst
index b52ad5b969d4..ff4fe8c936c8 100644
--- a/Documentation/subsystem-apis.rst
+++ b/Documentation/subsystem-apis.rst
@@ -71,6 +71,7 @@ Other subsystems
=20
    accounting/index
    cpu-freq/index
+   edac/index
    fpga/index
    i2c/index
    iio/index=20
>
>--
>Cheers,
>Stephen Rothwell

Thanks,
Shiju

