Return-Path: <linux-next+bounces-7595-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 357E5B082CC
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 04:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E5BF17B5EB
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 02:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE724503B;
	Thu, 17 Jul 2025 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lxSjdPs8"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918F8F9CB;
	Thu, 17 Jul 2025 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752718534; cv=none; b=idWxoQZloLRqbAvtM+ddXQaBQOxTPn3Valzjl1khVheB47H0jS+Xgv+1sL8ffT0gn7fBaYL/g5RZhoY9yaFK/GydPOa9lvOundihod/aJL+t3K17SRqFhu1QsQU24mf+MlwjSk3MAqSwIhKk9kU1FXGCWJlYqyouKn0U09fSOuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752718534; c=relaxed/simple;
	bh=XG+cmbdvgjwQikvnpt/hczQU6adESMW10opezMODMPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7b9gOE0zuFcNOybQH2HVQyLnwKyLW+Z0U1a+O3LvJ+Kf7hH7Y6Kwqi6/Be0vMs7hfgH3+A+iM092zYWbfn/nO0PeojEglt0dB9SpXXw01sphOiddPJDWfk336VSUYUYdSL3dKCmj/v/u7CDZM+8ZhSPjQyoGi3SEWH9PAF/WDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lxSjdPs8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JejxmrOVCgjiwO83S9674B0/ac8ZOFXjpXqojSrtghc=; b=lxSjdPs8V0ACFwULYBcejWAQz3
	0FWs1YOiHasEK2Kq0zbK/KCl2sVnwXq/wTjiBDumKYXllQOSveMF+buD4B0PA48a4WV9jcCJXYzrb
	GvnSWVi9fGxcQAgmUV/3FRRqMm+/p+FNvjIPHHzZC/sENmS4HwtNebYajli5xS9ANwH4gboWftDlp
	wQpF0XnKqk03MwvtrLOTwVvOUoKXV6jGZozaSvg97EPHK8lgnuSpFL/k8zoIxljtEw5VZT8n0978H
	3kmSp/aRlrTyDmvx9QcGlGeO/Tg+rvX+fPUOuiHEsP+wyGwfhr1UK+Ah+cUdrPp6iHbVsZuO5Evsh
	/EJOqFPg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucE9j-000000092yt-41wV;
	Thu, 17 Jul 2025 02:15:32 +0000
Message-ID: <589c2ec8-bd4e-4ab0-89ad-08a0a1c56c70@infradead.org>
Date: Wed, 16 Jul 2025 19:15:31 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To: "Zhu, Yihan" <Yihan.Zhu@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Hung, Alex"
 <Alex.Hung@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "LIPSKI, IVAN" <IVAN.LIPSKI@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
References: <20250716202831.68661f12@canb.auug.org.au>
 <IA1PR12MB6044F52C3C58284B49DD77DCE356A@IA1PR12MB6044.namprd12.prod.outlook.com>
 <CADnq5_MUdC_odm9LM09V31=KW+Td64PkodmvS9VJuFv0e=3w4Q@mail.gmail.com>
 <IA1PR12MB60448C621D9999334E7DF264E356A@IA1PR12MB6044.namprd12.prod.outlook.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <IA1PR12MB60448C621D9999334E7DF264E356A@IA1PR12MB6044.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/16/25 12:24 PM, Zhu, Yihan wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Alex,
> 
> I just double checked this parameter might be missing from upstream. I will work with Alex Hung or can you pls help me to add descriptions below to patch? Thanks
> 
> * @num_rmcm_3dluts: number of RMCM hardware instance

WorksForMe. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>


> 
> Regards,
> Yihan Z
> 
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Wednesday, July 16, 2025 3:09 PM
> To: Zhu, Yihan <Yihan.Zhu@amd.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>; Hung, Alex <Alex.Hung@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; LIPSKI, IVAN <IVAN.LIPSKI@amd.com>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
> Subject: Re: linux-next: build warning after merge of the amdgpu tree
> 
> On Wed, Jul 16, 2025 at 2:45 PM Zhu, Yihan <Yihan.Zhu@amd.com> wrote:
>>
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Hi,
>>
>> +Alex Hung +Nick for awareness.
>>
>> Thanks for the information. I believe Alex helped me to add the description in another patch. Please let me know if any further actions from me.
> 
> Has the fix been sent out yet?  I don't remember seeing it.
> 
> Alex
> 
> 
>>
>> Regards,
>> Yihan Z
>>
>> -----Original Message-----
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Sent: Wednesday, July 16, 2025 6:29 AM
>> To: Alex Deucher <alexdeucher@gmail.com>
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; LIPSKI, IVAN <IVAN.LIPSKI@amd.com>; Zhu, Yihan <Yihan.Zhu@amd.com>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>
>> Subject: linux-next: build warning after merge of the amdgpu tree
>>
>> Hi all,
>>
>> After merging the amdgpu tree, today's linux-next build (htmldocs) produced this warning:
>>
>> drivers/gpu/drm/amd/display/dc/dc.h:255: warning: Function parameter or struct member 'num_rmcm_3dluts' not described in 'mpc_color_caps'
>>
>> Introduced by commit
>>
>>   26ad78fffc66 ("drm/amd/display: MPC basic allocation logic and TMZ")
>>
>> --
>> Cheers,
>> Stephen Rothwell

-- 
~Randy

