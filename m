Return-Path: <linux-next+bounces-2747-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199091D8EE
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 09:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4ABB1F21CDF
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 07:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DE881AC3;
	Mon,  1 Jul 2024 07:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BoYxOi2L"
X-Original-To: linux-next@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3C76F073;
	Mon,  1 Jul 2024 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719818946; cv=none; b=h73CMcNj6Re6Ky86gh1WLqgEE4yelL/T3+D8j48RWs61SEVisCjNJRjubI2p942B7MgCqym8k+4g3D00M2V9qQUCFBROPPl37F7cP8RLO7dxQntugoIYhIMuXZhw+rHKaEi1aqeQc4q+awzJj5adFC+1KA8EcNWjjWpSEml5IgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719818946; c=relaxed/simple;
	bh=EDBgwrAXGm7DDaSLp8v9GIoqwkI5jZPyguJRT3ECYpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GHqdnAXP+84BWtVuSn7tEIEWLLs3kjtihhXolFYMS+6xqwaCHk5DsavU0VZGDbW16QQAB/0tBFR7vZF3CHegkk9BLHESYOoGQWkvb3j2pE0wg04DT8+m5RoegQ2hJrwqTOxpl9RqfHVb3m1APFyiRsswZMAwU7fpl+ahM1qZwtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BoYxOi2L; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4617SX4L043065;
	Mon, 1 Jul 2024 02:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719818913;
	bh=8kqj7nlnDR1MaaO6+mykpDKSibuX68b+dr81Cm/MSzs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BoYxOi2LfIQcCfLChCzE6+TQ4AK5ce9Qnz+eETFans/NaqxnFUtfNzHmtpz0ge89m
	 h/WUFTXo/83tL+ORwdRSjL3R4HKs/qzLRa+UTWDSYssvNDOaaB30YXxqjbZU9ZhmNv
	 SUtnIdg/LJP2Spnbj8z34dxAwj4YpascRh685QHo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4617SX81009870
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2024 02:28:33 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Jul 2024 02:28:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Jul 2024 02:28:32 -0500
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4617STOZ011982;
	Mon, 1 Jul 2024 02:28:30 -0500
Message-ID: <d595b624-ef18-4aac-ab2c-bd36a8c4de3d@ti.com>
Date: Mon, 1 Jul 2024 12:58:28 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the counter-next tree with the ti
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        William Breathitt Gray
	<wbg@kernel.org>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC: Judith Mendez <jm@ti.com>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
	<linux-next@vger.kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>
References: <20240701163749.1cb88c8b@canb.auug.org.au>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20240701163749.1cb88c8b@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Will,

On 01/07/24 12:07, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the counter-next tree got a conflict in:
> 
>   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> 
> between commits:
> 
>   3ad6579f106d ("arm64: dts: ti: am62p: Rename am62p-{}.dtsi to am62p-j722s-common-{}.dtsi")
>   77044cfb9346 ("arm64: dts: ti: k3-am62p-j722s: Move AM62P specific USB1 to am62p-main.dtsi")
>   ed07d82f9e3e ("arm64: dts: ti: k3-am62p-j722s: Move SoC-specific node properties")
>   84935117f25f ("arm64: dts: ti: k3-am62p: Add gpio-ranges properties")
> 
> from the ti tree and commit:
> 
>   131eaf47c4c5 ("arm64: dts: ti: k3-am62p-main: Add eQEP nodes")

Could you please drop from your tree "arm64: dts: ti: .." patches, these need to go via TI SoC/arm64 tree. 

In particular

7fb9d8854fcf(Judith Mendez)6 hours ago  arm64: dts: ti: k3-am64x-sk: Enable eQEP
afdfe6439a6d(Judith Mendez)6 hours ago  arm64: dts: ti: k3-am64-main: Add eQEP nodes
131eaf47c4c5(Judith Mendez)6 hours ago  arm64: dts: ti: k3-am62p-main: Add eQEP nodes
ba5a251b1d53(Judith Mendez)6 hours ago  arm64: dts: ti: k3-am62a-main: Add eQEP nodes
e2e1fce199b0(Judith Mendez)6 hours ago  arm64: dts: ti: k3-am62-main: Add eQEP nodes

Thanks!

> 
> from the counter-next tree.
> 
> I don't know how to fix this up, so I just dropped the latter chanhd
> for now.
> 


-- 
Regards
Vignesh

