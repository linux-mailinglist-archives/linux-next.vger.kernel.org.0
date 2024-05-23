Return-Path: <linux-next+bounces-2391-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA88CD32B
	for <lists+linux-next@lfdr.de>; Thu, 23 May 2024 15:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BC0F2856A2
	for <lists+linux-next@lfdr.de>; Thu, 23 May 2024 13:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB25E14A4EA;
	Thu, 23 May 2024 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="fWEDIyWs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7676F14A4DC
	for <linux-next@vger.kernel.org>; Thu, 23 May 2024 13:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716469487; cv=none; b=rKk5OxUiNcAaGFSNoN1t2FBA8ez0d3nHnJFHdbooD8fXL/kqbV5uQp90pqkAll5GqmrDb2twmnnXBeSk7IF0AurJXFZ2FxpR5Jhb+tpyAsX5APVwbVodcJbVFykoam+XchBys/xiNb4UnqBvmNYE4WZK9mHINbY+UBPm+dDqbJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716469487; c=relaxed/simple;
	bh=pMm7rZAZFGu1NTYvWOL9qrWRhbrbJa/MB80eW/64YQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYa703pKK117n/pVBaly/clcm/ccOjKZivNCPJv2e0Rrs6AvQApYwZcrVZO7TYZnoxLWgpxiqtNzgOGdmtRMLMfZj+dEIlaPY8YRtnb5+vwYcipDPsKjGVBRpC/50mhg5CJNA2EjvCJtEkUhSwK+U97GmNDxOiR1uIf85e3UEyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=fWEDIyWs; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f347e8f6acso423295ad.1
        for <linux-next@vger.kernel.org>; Thu, 23 May 2024 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1716469486; x=1717074286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KPMiHsz8K2q9s42urhdT3u4JtQG3XTLimzTD3UwspMw=;
        b=fWEDIyWsoHRobDxjN8y8zBcJpXMhNZugSCZlLrno0Lg0uAe1UGy1xrQo53rfs7+nwW
         vynd6rTRFDz0GRe846y7BMXgUiCFPS3VKsYHlyhSqV0+SfZ3yCp0192wTfI9i8pUQhzw
         Koe0Ls/K+yuSdjy8KVkb6skLzhAtAMQuHXL8GMe4K20HaVwPGHD9XQYFBsoSG8Od3aWV
         I6aMtaTPW/aE3dyD3zvZcgDqvbf76HP0GwhnpuLWVVFDnju7coSoAFrEUr4Ys+qTXeCh
         GlAIzOYKIHHI1t+q9e0fR7OqdfPaznuo9j90Otpf4n5heqRr1tbYure1VWG7ulCsh8lB
         5hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716469486; x=1717074286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KPMiHsz8K2q9s42urhdT3u4JtQG3XTLimzTD3UwspMw=;
        b=Sm50Z3XeBCuVCTPmsrvj9UQ/Uf+GVmB5BPJnfLa/jycpKgM6+VHQ5iNPFdBQ8ojah/
         a1vFwEmtOMVb9G2jx6LEjBYB7yLdS5iZEMh8bAwul6k1V1/idv1wAEwEFu8XBk5wJa/+
         SF1jjDeJ4/tN2o3EPV5dTHjy+9reAWYwg2vkR4zBuZeDtMAFtTD15++XYhaWPyrQrrqK
         yRkVgAdRZDtwRyorOgmrP+WHC92/tjY2DY+WwcmU1dk9iT9I9ehlG1rSicBp6qSWvAwQ
         cEvPKVNE9sK4kJVSCer0oZNZJT3hbjEJWgizUfKAQ0EN3z4WoXIYVPUYXMLlp34T+VMQ
         OzEw==
X-Forwarded-Encrypted: i=1; AJvYcCWEew4igvaDOH0AT1AS/8/KLmbhHYeLeSEVKzwOU1CVCFQ+XR9Tr7GM8TvFpo3QbSe32FCnoMw6qbZWlOCKN8jrvcJYGfMmWDVtLA==
X-Gm-Message-State: AOJu0YyRLjn5mQ/GLsaGDXgnvDSV37hy8kkw0Yoekzhyg2c6xATibIwY
	1BbixCGLY3QKUnGZb7QsYAe4Qkx1Mbs1uJJVMppk61cTlsp1HXA95WspFoWQbVU=
X-Google-Smtp-Source: AGHT+IGrW1xaiN9yzpdbCzUOTirocWCGoUs5hr3wkk51ksk12WLfAaS+/LYfk8LQ6+Q8R4jw5nldnw==
X-Received: by 2002:a17:902:c402:b0:1f2:ffbc:7156 with SMTP id d9443c01a7336-1f31c96453fmr51875535ad.1.1716469485752;
        Thu, 23 May 2024 06:04:45 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c0369f1sm255650015ad.185.2024.05.23.06.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 06:04:45 -0700 (PDT)
Message-ID: <8cc049e2-157a-4b25-af00-e706c0071e64@kernel.dk>
Date: Thu, 23 May 2024 07:04:44 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Yu Kuai <yukuai3@huawei.com>
References: <20240523095035.11a94157@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240523095035.11a94157@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/24 5:50 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   block/blk-core.c
> 
> between commit:
> 
>   ac2b6f9dee8f ("bdev: move ->bd_has_subit_bio to ->__bd_flags")
> 
> from Linus' tree and commit:
> 
>   9a42891c35d5 ("block: fix lost bio for plug enabled bio based device")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks Stephen, looks fine. I'll mention it when sending in the rest
for 6.10-rc1.

-- 
Jens Axboe



