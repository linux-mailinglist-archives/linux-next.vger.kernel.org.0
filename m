Return-Path: <linux-next+bounces-4743-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF749C41A4
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 16:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62A512814BC
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 15:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E1E19E997;
	Mon, 11 Nov 2024 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="cq/FCo28"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB22518A6C0
	for <linux-next@vger.kernel.org>; Mon, 11 Nov 2024 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731338089; cv=none; b=H3L5Mm/IYAeAQSfhqA8JSzlLpWds6ag/JfiDocaWHhbqw0tTeeNFLy5+Gv3YMRFzKeoUHB7dxjxXSB58/iacfkP/1xVOBXmUfdEvPqTIAh/9e8G27SuTdwH58r5rvsvZIx9CUJs3KVJHXCL8bJiUepB/XEf6YF5RpEn2Wbng3Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731338089; c=relaxed/simple;
	bh=UnPcoZ/mS2Qlmy7QVtab8EhHtoLabZ0wivst5i5cF7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LELh7HY7jYGoiwkDsSxnWoNUmb37/fSn2C4WOCOql3uXr+KMYuOVc3nR+LM5mlruq8CLJ4mS0V0Zb0tIm3E4w7jR2WTxPJYAnNabcFXp3rmHLLVc4XghEf06d0O9DXlCo7EcUPHyDi8lGZFyjNboIhbrtSDu6kheyZZ+ouM2wlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=cq/FCo28; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7180c7a4e02so2578978a34.0
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2024 07:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1731338087; x=1731942887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rbb3ioDkWQUtkUEGcUOQSAFySHBMZKciKumQ+CVhPVU=;
        b=cq/FCo288GLIokrH2UmLTFR2uNGOJtF46wZ6nM6oiOPe0IcXhPboht4W66WUW4rDlr
         wlhL2rh1s0isHGSHsUWO7ZZ/L4WeyDzCohcwPrsV/2t067Osg0Tcm/YMEgEQW4xU6Lr2
         YpTYWpcer420gGK4a37rHkoTqh4idQ+J0SHyhMhuhbZyxuZ16yXz/pW+Dp/b7sg5Sg8Z
         cTOOfQwKl2/mu1GDVEOWeCOYTv/iVdmqMQNHxU5djBezgeS1n2RLEh5sgQqIZlXfiEoM
         sWLn3IDtZIKGKB4FmGool2wp8fQL8aO+TzBUi18wu2VIVg1oFdDFLu9hjx+iPwYeESa1
         F86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731338087; x=1731942887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbb3ioDkWQUtkUEGcUOQSAFySHBMZKciKumQ+CVhPVU=;
        b=XAvKLXpni6zJBE7zMl/X86hhuW74KntrqYTEeZ6tCJL0E3ZtT9dSL+lz83I6E3kbFw
         KiiqONHDqBAKHYzZvCR3TiNduWhuNKke7b/IddWfm/wCCC34Q0xrtJC8C3l2G/1HfXdC
         HxBsr/KGruUfobwsAgSPQqL0h6WM55dErgUtzCF2i50SAztByu28ywumEYQRwXtTaCgL
         0Ti680YLf+N1Up2JkCq5ypIYDS55PTs/qQ1JHIFYYKJwQJ+PpjWyAWu4PqFCFnZXbg9P
         BxzCIG7TCCw6uTptvq2qFaXBT2/V6Alxcju/gCllw/gmyObD8SOwGpUhH0r1kL5o6SHs
         WjEg==
X-Forwarded-Encrypted: i=1; AJvYcCWBgg7NqyBl1CU46mbC9WvTgI+uOX//nw3/wrCn0kL7J7084sCbki59pakwNfYRnI4AzIVLKhPYvbvI@vger.kernel.org
X-Gm-Message-State: AOJu0YzR/bCp+IxVqJATeyhJmJ85hmOSA4zlEOeG+9yVJBZVmoK7VBHM
	kV2EiUpdfq9cNGVH2B72y7IYjyV6USQy1vuQW4D1VUd3vemj9+hNfwjUbICMcwM=
X-Google-Smtp-Source: AGHT+IEWftHGeRdWbnyVuxtSjbsVpJKzpmKgkCgPXFwdzBrutzyKUBQtoJjDqWRiqfn3hnNrOWo6eQ==
X-Received: by 2002:a05:6830:6109:b0:718:3b7:23e4 with SMTP id 46e09a7af769-71a1c28a6a4mr10720803a34.23.1731338086775;
        Mon, 11 Nov 2024 07:14:46 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a108e6f9fsm2251567a34.46.2024.11.11.07.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 07:14:45 -0800 (PST)
Message-ID: <e2a01b88-6cc5-43a0-bbd4-2a583231bf8c@kernel.dk>
Date: Mon, 11 Nov 2024 08:14:45 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Breno Leitao <leitao@debian.org>, Keith Busch <kbusch@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Ming Lei <ming.lei@redhat.com>
References: <20241111141033.2485eb96@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241111141033.2485eb96@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/24 8:10 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   drivers/nvme/host/core.c
> 
> between commit:
> 
>   6d1c69945ce6 ("nvme/host: Fix RCU list traversal to use SRCU primitive")
> 
> from Linus' tree and commit:
> 
>   6b6f6c41c8ac ("nvme: core: switch to non_owner variant of start_freeze/unfreeze queue")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks I sorted it out in my for-next branch merge now.

-- 
Jens Axboe


