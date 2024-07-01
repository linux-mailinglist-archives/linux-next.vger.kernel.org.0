Return-Path: <linux-next+bounces-2769-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 787FB91E084
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 15:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D0881F24015
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 13:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C59115E5B5;
	Mon,  1 Jul 2024 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WlfL441q"
X-Original-To: linux-next@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789B6158D94;
	Mon,  1 Jul 2024 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719840059; cv=none; b=sFCFBtKVwkmp+GeJ/Opwi5c1I7u204fIV/NbHXb9+84+7DqFvBuTbL01y9Z/go81QOarNKZ1PudiV1bL6Qk736U/zWktP1gmI/zhhAYFkauzsXAzz8TGbqH55mCKucXWfdRF9mpbGqhZb5n1ZMQM+Hxha0Bm4va+n6CDon7UsLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719840059; c=relaxed/simple;
	bh=mtrtSp478FPKF9vQGKwAdqQFbIH9LnPG99zKGDECjCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XlBYuSJIAk6jB0aZya9w9L2G7gc0Rjl2k0exr7WTKKsZ0OanpybQUGNEH3edBb0VHBdBc7TaecPwhsNMl/CI8d4Kk8jvUriysRw1++MYVxA1lwvMdw0RoqIqvYhB5DyuMormv2+Wv1haG11hQreeZ1xTN3nTW+ccE+icx883fyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WlfL441q; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 461DKjOJ057076;
	Mon, 1 Jul 2024 08:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719840045;
	bh=MkzSmS/kf7DTFI7fj9Gv8FL/b/S4vI/VbjMRgXYS3xk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WlfL441q8K8vQMq6D28808EkQEtVCWHHl4l7C94pDCd+iY8ewze0+cCMSE28uo+PH
	 J7EPqZrdGBjRkhB0fWp+8LkeumN5yub2bEk2FfpcpOE6gEOlc31pjV+3asBGSZENnC
	 2gPQihTODIOi3NnTEHSLCkUbFROetrJ3AleM4jYs=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 461DKjUi006884
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2024 08:20:45 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Jul 2024 08:20:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Jul 2024 08:20:45 -0500
Received: from [10.249.142.56] ([10.249.142.56])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 461DKfFk008547;
	Mon, 1 Jul 2024 08:20:42 -0500
Message-ID: <d15a139f-4561-496b-bc3f-429d997ff014@ti.com>
Date: Mon, 1 Jul 2024 18:50:41 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: linux-next: manual merge of the counter-next tree with the ti
 tree
To: William Breathitt Gray <wbg@kernel.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Nishanth Menon <nm@ti.com>,
        Tero
 Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>, Judith
 Mendez <jm@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
References: <20240701163749.1cb88c8b@canb.auug.org.au>
 <d595b624-ef18-4aac-ab2c-bd36a8c4de3d@ti.com> <ZoKANeudCKsjjYDQ@ishi>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <ZoKANeudCKsjjYDQ@ishi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180


On 7/1/2024 3:38 PM, William Breathitt Gray wrote:
> On Mon, Jul 01, 2024 at 12:58:28PM +0530, Vignesh Raghavendra wrote:
>> Hi Will,
>>

[...]

> Hi Vignesh,
> 
> I have now dropped the "arm64: dts: ti: ..." patches from my
> counter-next tree, I retained just the counter patches.
> 
Great, thanks!

Regards
Vignesh

