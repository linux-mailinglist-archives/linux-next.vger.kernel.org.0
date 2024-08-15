Return-Path: <linux-next+bounces-3325-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA5952720
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 02:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD30E1F228F0
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 00:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAAA15C3;
	Thu, 15 Aug 2024 00:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="U7NHaOIS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844431362
	for <linux-next@vger.kernel.org>; Thu, 15 Aug 2024 00:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723682819; cv=none; b=Ps8W3MqHOYR1PZtH7cyh+YP8S5Vtw7gFXfnIs04PTWfgus5anXxesRbHJgBlDrX1dXriHcwbKGcJr2v+GIO+XoOAVxcpI6rhX2glrYAAcDduuyfaO16iZU5vN55KcBZZxG7o2fvV99ntMbrKUWgnLr6xfYaAs7kTKslj53zY3vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723682819; c=relaxed/simple;
	bh=3tmMBYGSTidS2J0YNDLYdwAJjKHTKttL1XczPmem7Kk=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=CqAJTWLRV/sc9nj/18ao6yfiqNCMfjF25Js9H6JAkARrW4yzHv8PTZSMkpybkNKMuBM6uF2sHuuflEdDEKjB3fNnQHuiUKmXLJ+M7Y0EBimHBnbWvFFmjAbYabt4fGtDaxyWzXb4SyOZ0ofR4oTmNNrkTEgIFB1q8i+irTd9dJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=U7NHaOIS; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7c6aee8e8daso353804a12.0
        for <linux-next@vger.kernel.org>; Wed, 14 Aug 2024 17:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1723682817; x=1724287617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOiM6bmI1vM/hsAFJvAlGAa9CNK8Dap8ytIn80nwGeA=;
        b=U7NHaOISJhrLYOauyYOp3CNaDQijiniZQRDzcP1RHQcybcVCSw/0pk5vvgsGIbaRLq
         QDIBba0vM5pYaPotUwsjwETZel2Wb6BTQWwZYpgdqL5j380DeTnB/0XcfoYZ+yKAN9Kz
         POACZxUSVmcVeixlQJiCXH/SoC9lsTp+eK2sIRfo/uVd+Mt9t0ixAN4ZY77Q5okVWgLy
         iVo7J+xVKsLo4+JfMIF8e0ghcdUk2DX6PeI/psvpW9MCxmaY9prprPzPjAzWA+QpRA3I
         PT5UR7+PVIlOfWji37fasMNJsrl5Bn3ddlE+uyJHWRlnZEd4Y4D55751RyY4CMNMGuvA
         K9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723682817; x=1724287617;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOiM6bmI1vM/hsAFJvAlGAa9CNK8Dap8ytIn80nwGeA=;
        b=K8hFNhYdJq1Yt6I3ytYSaLTQ26F2wbV07ooIs/YH6gYK2IYGRSlyFhj0xy/Hg3dNrm
         8tNN1DcKHBiqjjSiI0hx/uFkMu7Q4uQS0WNlkQ/UVlxJiIFKyqJRAPF+8Pyvvz9HFO7K
         GCQ71Sa5x0tMbfrAUwV6xq1kP8Ec7+GxSbl/HLC4ORBxrCMNKkehN59ttew6eW2cv9+M
         amHL6oOwIM9EPCV/jl9L6VcHgDGlaFHH2YKwmFxnzIWI3TN0ikH3ah3znPpsws/MGnKg
         LVe1mryYGBQx71JUxPQ4p909T/gIROVyfP3kU3FTr94gpwr6NkJH35jXry9Hsv363pub
         q5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVDuE2b7HIBtrQXJLwkCWZEBlnrfUlZHJNh83XY/UjPfFlMITSxpZC8E83T7lptstrufaSTeorI3AHts/PiZIRSv1CRdeyPeHm2dQ==
X-Gm-Message-State: AOJu0Yw3BArlbcI5I/2/KkUpZ1G0OOe1t/efG/fnHu8Rz7qIdElzkhcC
	uCGPz81/Ii27NtSjBZX3TDXB0xKsPYSN3dAmMWo+Bnzn6ftDR0L5qiqJpgeLi/4cYQm4d245O27
	E
X-Google-Smtp-Source: AGHT+IE1x/X30Y48KdsbfRxZW5R9WniMm/D06OqnoW/dXs96xK9iG9nxx6lRPnRd1DEkKDQWTD8vsw==
X-Received: by 2002:a05:6a20:c88d:b0:1c3:ac70:f579 with SMTP id adf61e73a8af0-1c8eaf7dae0mr6647686637.38.1723682816596;
        Wed, 14 Aug 2024 17:46:56 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3c863a671sm263698a91.2.2024.08.14.17.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 17:46:56 -0700 (PDT)
Date: Wed, 14 Aug 2024 17:46:56 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Aug 2024 17:46:54 PDT (-0700)
Subject:     Re: linux-next: manual merge of the risc-v tree with the mm-hotfixes tree
In-Reply-To: <20240815101714.4422f93c@canb.auug.org.au>
CC: Paul Walmsley <paul@pwsan.com>, akpm@linux-foundation.org, ruanjinjie@huawei.com,
  linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-e24991b6-0573-4c36-ac15-bf92a8fa6408@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 14 Aug 2024 17:17:14 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the risc-v tree got a conflict in:
>
>   kernel/crash_reserve.c
>
> between commit:
>
>   ce24afb8be8f ("crash: fix riscv64 crash memory reserve dead loop")
>
> from the mm-hotfixes tree and commit:
>
>   e2acf68fb1c5 ("crash: Fix riscv64 crash memory reserve dead loop")
>
> from the risc-v tree.
>
> I fixed it up (I used the former one as it seems to be a more recent
> patch) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

Sorry, I think I picked that one up by accident (just saw RISC-V in the 
name and didn't notice it wasn't for my tree).   I pushed my staging 
tree to for-next this morning before having my coffee, I bet I'd just 
forgotten to drop it locally as it'd been sitting there for a week.

It's gone now.

>
> -- 
> Cheers,
> Stephen Rothwell

