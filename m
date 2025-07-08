Return-Path: <linux-next+bounces-7410-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCDEAFCCD6
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 15:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CB98164EB2
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 13:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704A42DECA0;
	Tue,  8 Jul 2025 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="C0by07T8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078B31E5B91
	for <linux-next@vger.kernel.org>; Tue,  8 Jul 2025 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751983095; cv=none; b=Sx6l8r8gdZsgFblGsAclwvFg0tTZjELC/CuOQZBooUIHq6J43YxchGN1b9SDs79vAZk+DG52EYeMNHagSjN4yg40toCK8pYGF/6r9LH3TKq2yLiM3F3VcRFtZckGure8m8wdFohz9kE9P4PLX8zMnCatHUp9+V9BJPAtlEvJnJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751983095; c=relaxed/simple;
	bh=6T/LyVDkqfdGqAPt3IJFUu0IpZrh3nknqSqj9wa5YrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxsvB1A+dPUrBBKasTFMepYv6+sbzzwUkDxe8jwcwRY59SMdl56hMAPSIW6bh8gf1FQVG+dvo6BmyFufhoHYvOkmmkWNR+71d4ZPE3/RSCD8RBYFu+T5FmNHM7xRSsMeSdbIXkKbfvj1MCIDUVrDQ97IDMZh0KTQfVut6+ZUPeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=C0by07T8; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3df5249601cso35312315ab.1
        for <linux-next@vger.kernel.org>; Tue, 08 Jul 2025 06:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751983092; x=1752587892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dWG9le0tAvcM6U+B41yLxhv7xdUTFjQ9nxy+a37va4w=;
        b=C0by07T8OHvvHZdbzBQoTC6YmkLqUQvJCS/MD5/q6zVl+/cWv+9+9dAv5euXo8ASGn
         1SvvAQTfBJzvISPitF5UCY180Y5GfxwmWQlXV2iwU6Tkx3ppS3xH0ACcdsonPQucaYGL
         Itu+0fMDrW5P77/YGWuBQe/Q35MlYzAYvaS765TC9FEyU6gNw6ylV+ZhrHTIj9x57+KB
         paQ33Iize/prEc2xuE8W/Ou/dBz/xhd2HrrCoVxT6fxq1cfarISeUa2m6BOESNlTN3eg
         LRY6/L2g6gTx8i2X0ero8fXF1UrYAZ0RlQw8nKeajWitFh/5hZKBy60tb25h1QkXNNh0
         9FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751983092; x=1752587892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWG9le0tAvcM6U+B41yLxhv7xdUTFjQ9nxy+a37va4w=;
        b=l8nLrEx/FtAg7pZ6fxKJH1gpNN6Sp0X4L/GUoPb2f9uvL+qU6R19lGkJr5O7NSeFKT
         hDccf8imdNRRyMKZIYrRbxeiGrxM5oxj5YTaTGSYeQ9J2VAZz5lGS8MCPWHRSObIiBG0
         C1BcNU7kAZgVRk8AGtrHXZPXkjZOTBrE94pmAntn9nq1EGzFFvfiRhnnPl3C/gdFqcUt
         vpQfSrpVb2xq5XgpS1qx3V/8k4CXBiKiWvKIO2N2RNIowRQsO+92F0fsn9YWjwg5mOpd
         AsFc09Tl3n/JP8FtgnbSJWdNadWHilV1NgcFOtCDlGEKrdcwx1ZpnlN5pBXIoRYjQ0A6
         4CZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbDT64Y8LmiDWlPiuMWViDCgP8JImcOATqQ6VuXSGcVSjCXmfmCsqugrH/PrbTzyt13ridbN/i7XrV@vger.kernel.org
X-Gm-Message-State: AOJu0YyFubhDP6Jzi4wzg2D4iroGj+uuaXpYaeU7WrVMAB2IjQHUsPHH
	e7fwtMxOe91sUnoI1h6vD4ANz0QvvxGeQiCDNxOQCToveIOcx5PrbrY44Fzx6zNOg8n/wqH74IS
	GlZE4
X-Gm-Gg: ASbGnctjExb84AlGmuZ1GdDkTsw0tIbIKuhLVWqWTeXJWPF9VlgsmYBzk5bUrBVcEvI
	xlgw1hg8V5+X8hyda3Qby3chlBoBz+xMVeUpuvubo938w1Agb46SUpBs9zB4/doty3WJZTfqx0R
	JqfjH3s9LsjGYqCYYpkRYyt9uJSP9YjQLqWOqLTE96HxAGMpUtmUvLnRh54MFOEopegp6+vh3nj
	5tgrHvDc4Z365RNTcBcFU2XTQDJajOA5PqF/pEuxvyVuwxGOKQokfndHZx29n7UvCLubIqR5dzR
	DRHferN/aCZIh1gqi3IQu5qY+4r5KFqAlts3NRsDIFnyfMvGQ8VEDnapRx1iFlowEKmKfw==
X-Google-Smtp-Source: AGHT+IG09TilT5nlfG30pj55LKIE+PZrKro1O6jNo5c4L+OMtBt3Rlep/ZPBo61IfrB6cu2JV/LWjg==
X-Received: by 2002:a05:6e02:258c:b0:3da:71c7:5c7f with SMTP id e9e14a558f8ab-3e1371fcf1bmr157473315ab.15.1751983091851;
        Tue, 08 Jul 2025 06:58:11 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b599a42csm2212527173.14.2025.07.08.06.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:58:11 -0700 (PDT)
Message-ID: <7f6c2bb3-2b90-4d72-b0f3-dba6a347dc68@kernel.dk>
Date: Tue, 8 Jul 2025 07:58:10 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250708191115.68613291@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250708191115.68613291@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/8/25 3:11 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/cdrom/index.rst:7: WARNING: toctree contains reference to nonexisting document 'cdrom/packet-writing' [toc.not_readable]
> 
> Introduced by commit
> 
>   1cea5180f2f8 ("block: remove pktcdvd driver")

Thanks, killed now.

-- 
Jens Axboe


