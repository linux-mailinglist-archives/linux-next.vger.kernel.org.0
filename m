Return-Path: <linux-next+bounces-3717-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E4397251A
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 00:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4558A285804
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 22:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0AE18CBFA;
	Mon,  9 Sep 2024 22:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="KbhyiewZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E50018A6B1
	for <linux-next@vger.kernel.org>; Mon,  9 Sep 2024 22:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725919949; cv=none; b=FcNwgMXkYHPJWY3C4uSZhvmYtYaEK0RLARtrM0s9zn1YAI3JSfnXv8wtjwkmQZRmzAcvdjU132Lny82p9PRmf1DL2TcIyQp3kxc2aGjiaPS1QFVx0ik+m77Mxt1+8bIEcsAUiaUSTsn7Nvw3oj93zBvz5OLVtTA1oGqblSDr31g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725919949; c=relaxed/simple;
	bh=YVJXBVjLH/qjPhsAuB8GO1opHaSjlvv+AH5wT9m58oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POL5Pqiug6//rUNHe30tiQw/L6qOKHQKeq2nCmsbVetrnNB6qCtjBFb5db4gM+2gTIAU8vXGZjlip7QLKB39tZNMQFNftc5mX6GXEZq0VfKRKqW9L1zI36RLnQx8md0AtzUr238/shLoy+VXKXek94SXBD7OLyC5Psa6vOYCMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=KbhyiewZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7d1fa104851so3035044a12.3
        for <linux-next@vger.kernel.org>; Mon, 09 Sep 2024 15:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1725919947; x=1726524747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwoXTj/wQk0KjSjlfQVQbj+IGyz2p6trsMliz69Li6o=;
        b=KbhyiewZbYKNZZvYoHPt7NCEg41o8anGjdcDljfG2u7+QJ4QtJm4YfKgE4a+WqhmK2
         Yxe0OnGMyXExzOZhcGzfo7o3HX1v9wQPwy2cJhjPPjV+oNEC6xijfM0/gzGgObcdD1W1
         8uDHtwZN6sYin+0pwu17FngEjjGs+uFzKkK4SsyQ0UcKupuwGcCan0Hn4ui6fNjYsQA3
         WbHWR0Ukhg55vSsR0DR8HdnF2TU4YshSB7RLFAf8zeeKO84AFaX6qHUmOGymodR9mv84
         1F59drCCFqYLM5da1hdc3bYerNBG4gJ5kLB3gTj0zpwwypHp582v06K8t/MquT9WS8+e
         yoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725919947; x=1726524747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwoXTj/wQk0KjSjlfQVQbj+IGyz2p6trsMliz69Li6o=;
        b=q+LdYII1gitHb/9eaBUjFv+velHrOrTNHlqsz2AFxptgRDXjt+i349BpPrSzgzKUvl
         Bb3mgBWH66D3ii6WoQr/oGCDpAE+RrZLbZqhSyOU9s+zi2lMuDC1IuPSzB9rhWrLE7Oj
         1B64TL32q9PdltcQgHBv8JOrzZJ5QfkAStsIRqAj6gil8LFegB3JKIUpzKy6OdQcuITl
         u0E53HrBore+f3ew20jgxmxTu9tixHNl9TfzS3U1U3bFlj+GONgZN3kz5m3RVJkim56M
         cJgwGJNJQILlpgX4tZup6g5TVKu/WNdDRq1PzQT0sL7FCJ1B1yZOkwHOBtWpiEAjKRKP
         RbrA==
X-Forwarded-Encrypted: i=1; AJvYcCXpJ8u+7b4ngpzOmbm+ebbTzgWZRzU09qRRo58TZTvllQUajspHYaxvS2SFqQmOYmoIklFiK2fDPWam@vger.kernel.org
X-Gm-Message-State: AOJu0YwWGb+XrhzZh6UgPPu5DdrtchbhUHelYA3jQFUvcDSd+ATz+hgN
	PsJRW1z373WXlrPsGc+RdCDO5lGlGaIK1nffGPZw0k2fv/iP8rDYuFU3IZ//KN5HVmwBkqaquAN
	J
X-Google-Smtp-Source: AGHT+IFLiey0cO/PHvsLMRuqy0XiPSW0/LdXMLWa/ZTgLGEvQW9z1zvyXQbhxY8f8ZrXGV7H3o29wQ==
X-Received: by 2002:a17:902:ea01:b0:206:cfb3:7232 with SMTP id d9443c01a7336-206f05e7eafmr207950315ad.48.1725919946511;
        Mon, 09 Sep 2024 15:12:26 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e324c9sm38203915ad.70.2024.09.09.15.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 15:12:25 -0700 (PDT)
Message-ID: <fec13c00-52c6-423d-a106-1d3be74352f7@kernel.dk>
Date: Mon, 9 Sep 2024 16:12:25 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240910080605.4f26649d@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240910080605.4f26649d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/24 4:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   da22f537db72 ("block: introduce blk_validate_byte_range()")
> 
> is missing a Signed-off-by from its committer.

Ah that's my fault, I can still fix that up.

-- 
Jens Axboe


