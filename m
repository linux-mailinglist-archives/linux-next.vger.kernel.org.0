Return-Path: <linux-next+bounces-7421-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE20AFDF77
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 07:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8128A7B8114
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 05:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D092F20101D;
	Wed,  9 Jul 2025 05:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Z++zlc7p"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D59A1AAC9;
	Wed,  9 Jul 2025 05:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752039916; cv=none; b=Y7tGbCI4IQ8S0QEU8NGvFRZqIKb7KUNt17A5KFFG0QszVCzUk4yo12CtLcAhQt4+c1FyH8HpJ9oy6YcG29xpQzEwpROzXXnEcZxBgJ2ulVmcc04bSDJDGn414wZ9OaG7EYN13w8qfRyYUMHc5IqOPky3Vdh+Kc/4XYB17kDqorc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752039916; c=relaxed/simple;
	bh=MLwJSaNy/Bc7qmSG3O9RCZ+kFUNfT/d3ceWF1/Kxxko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9IaqGY00+/6QhJrCQAowbVu0caaiFGDMUAAPVvKgs95cetPexQd5Wq1mO+3EcB3vVeWeJUvv5V+romNMVAMvyzEdJc2VFcoASbtc5d7zb5WunWQiWDxfptXXBA3TnVCKK9F01qNY6xmX0ioQdvng9Pl01iy1TURxJauEHZhyXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Z++zlc7p; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=8mQixtg1Mr09Oj1fV1YdmAgl6VShD1E1tCnIfiueisQ=; b=Z++zlc7p2qGA9D5ZRKC9YNbFY3
	yAzcvK+JZPvn1GmRb1OSjW6ozZEXI3NpFDj8dZCopEyOQ6weJXPh3i0IY9OTiAhF1rhcvUMAisBG3
	PQ1Y7sq7YCdZbqhL4sMorjXOpn+HH/Z1GSzxuTke8tVAnEpRFH8u/mP2j52XtpVrG4g8YbxAu8X4l
	XbgY1SHLIj5HwrVJxMh+TozTd/ffALgTqlQALyU9FdeU9V6vNj/MCo0DvX30Vy1OUT7kZYnF5nBTM
	ZcdzqLbfn/FljnGWqE9g6W+Sj0m0b2lm6xSnm0NqThARVN9/9yjUtvFkgI3/Buhp3+nzhdyXSdMNw
	6hFGMK7g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNcB-00000002f03-2geF;
	Wed, 09 Jul 2025 05:45:07 +0000
Message-ID: <d1fd1efb-58d8-4387-9eb4-3f049a585459@infradead.org>
Date: Tue, 8 Jul 2025 22:45:03 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm: Add missing struct drm_wedge_task_info kernel
 doc
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
 <20250704190724.1159416-2-andrealmeid@igalia.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250704190724.1159416-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/4/25 12:07 PM, André Almeida wrote:
> Fix the following kernel doc warning:
> 
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'pid' not described in 'drm_wedge_task_info'
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'comm' not described in 'drm_wedge_task_info'
> 
> Fixes: 183bccafa176 ("drm: Create a task info option for wedge events")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/lkml/20250618151307.4a1a5e17@canb.auug.org.au/
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v4: Dropped "the" from the start of the sentence
> v3: Make it consistent with drm_device member description
> v2: Add Reported-by tag
> ---
> ---
>  include/drm/drm_device.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 08b3b2467c4c..a33aedd5e9ec 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -35,7 +35,9 @@ struct pci_controller;
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>   */
>  struct drm_wedge_task_info {
> +	/** @pid: pid of the task */
>  	pid_t pid;
> +	/** @comm: command name of the task */
>  	char comm[TASK_COMM_LEN];
>  };
>  


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

