Return-Path: <linux-next+bounces-3315-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC56395185A
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2024 12:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48535B243E0
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2024 10:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDFD1AD9DC;
	Wed, 14 Aug 2024 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mDw6wcLA"
X-Original-To: linux-next@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD25F1AD9D5;
	Wed, 14 Aug 2024 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723630032; cv=none; b=RvRnzIsoMlRxvF04adopqTL247g+Ix77TzoFqMVbpqav1oIaU4WW2FzJL8xIcASt9t/874XdE64/maUnhERrnaLP4BlxG8/MQXGyfzgXPnMZBjSCMc/K3/p09juzhcEiaVTBAFBzvSccGIolQx5qwqYW8dYpFWYCxn3d0R0bYcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723630032; c=relaxed/simple;
	bh=5XsVB9GL2OZJPnbet8x25YvtPAzHgMuoE2yoMAGVXL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QT0r1sBnB0H0CF7p/6gWhNVLqLEmu1VAXEIoccuPwXaiGyv01OSCG1LSRaVEbZvlyvTxzPwB2YtzZ8HZLPmgTXrU3BhO1fGTrfad+cnsEQ4AgKTXV1t7fZYfJmg5+gGm/QwgovdmM4kdXpAm0/QLv+MZyPeruPqTcFpUp8NVLLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mDw6wcLA; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47EA6lx8118766;
	Wed, 14 Aug 2024 05:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723630007;
	bh=Y1bHplFzRvIN1uqp7gkLUfaMsf3OGsV9ARnhFdIWt34=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mDw6wcLAihrnQ0IKIGf9SKL7zoRzT4tnnkxyq8srXnGV3mLmeozxm5Y6tcRHV1zID
	 vE7EL/tGfp20m0pT+lB4jqnYP7guAp9hzfG9cJWxgTQlAF0Cw7QLTuLyksjjwxeGia
	 JFNdS+o6OC37jOzcwyrREogLhJ7YzeYI4tZsPElM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47EA6lpO071525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Aug 2024 05:06:47 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Aug 2024 05:06:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Aug 2024 05:06:46 -0500
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47EA6j2B019371;
	Wed, 14 Aug 2024 05:06:45 -0500
Message-ID: <51158ec5-9f27-4c3c-b61f-485e6abc2ae6@ti.com>
Date: Wed, 14 Aug 2024 15:36:44 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: trees being removed
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List
	<linux-next@vger.kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20240813085147.786004fb@canb.auug.org.au>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20240813085147.786004fb@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Stephen

On 13/08/24 04:21, Stephen Rothwell wrote:
> Hi all,
> 
> The following trees are going to be removed from linux-next because they
> have not been updated in more than a year.  If you want a tree kept (or
> later restored), just let me know (and update its branch).
> 
> Tree			Last commit date
>   URL
>   comits (if any)
> ----			----------------
> cfi			2023-07-09 13:53:13 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git#cfi/next


Could you please keep this branch included for a while? I expect active
contributions (although will just be handful of patches) here.

I will remember to keep this updated to latest rc when there isn't any
new things to queue for a window. Thanks!

-- 
Regards
Vignesh

