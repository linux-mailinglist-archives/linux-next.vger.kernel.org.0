Return-Path: <linux-next+bounces-6729-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E08AB4CC5
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 09:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9517B7AC908
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 07:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CE21F09BD;
	Tue, 13 May 2025 07:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="au352SAD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3431E3790
	for <linux-next@vger.kernel.org>; Tue, 13 May 2025 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747121496; cv=none; b=RABm6VzsPcyBquL5v8B8R4Br3IL79gc/CJ9OmowDqNz5tmX3cSSUcY1uBVXq6xyahClEBwIzpuWz2PHoAz0YR40mG6slCPop/Yc8yjNazyQQA6VgYJZZ1A2lsJrNfIhEQDjMYk3hlL2tc2x0lKU3GOs4WQLPwU9AYnp88TT40uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747121496; c=relaxed/simple;
	bh=9odgTkdLCas6jYuMTaJIc0B6Y2SJdn8562yIGJ420z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQqNIujmXaBWK3wJXhMkXEdlcir0MsP6oYWMeSQBwIzEiZPBB+/UM3nUBv02bWaj8ZymHh74kc6DNVB40PPrfwjfVwy83L3o9jVVU0KddtFpj8j7oVUUK1rGBoUTTog+wkPL4P/xkDlyXH8c925QZ1gJsDNKtTT7J3UPKmFmQeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=au352SAD; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fbee929e56so9992443a12.0
        for <linux-next@vger.kernel.org>; Tue, 13 May 2025 00:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747121493; x=1747726293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmyTnoNmo8CKChb6T5xGX5uYcPPcN5SMIuL2HmFELKk=;
        b=au352SADxvJQEUsjrHbyA60katGPMe/fM4mgU5c5vezLBAUhLXf2+sJETBo1Ut5CIO
         UKBKZnRgESoGOR/jpbWg3Qa32eMGJXvl3xMmaKE6uuacco0d8tc4mSN3ie6ZSlUoKOsF
         SXvCYN7QMyBj+7E+64C9iskwprYwbeAdId1JC1zdqzLhIRQvL2G+x39NcL2epJbWj9UV
         opf3qyCxyEjYLyTUNmhcDXZrEUv7z3kJtTbOWqSO5jV/HZMODc8gE48V+DJIs1XqDISn
         ncStnTWEsW/1NcuhRwN03dSsox7E4wQl52kgYtZY93eoaz+lIl20FFyNW9h9v+KYkOS+
         /NGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747121493; x=1747726293;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmyTnoNmo8CKChb6T5xGX5uYcPPcN5SMIuL2HmFELKk=;
        b=MTQBXGypSZ/llX/ETNhVK1+nMUV+BdY4Ou2Db24G5zpbgkaRF+ajWRp/YURECGM+Cl
         z3uaVIFtWsOi6e0fxEU+94j5y4tIC/G5tF/l43FdFnrv7KnxYFsGXc+Onycg51ke5LtE
         aqVvi6Y5lD9bTlW1XeAmfcahw/Ejs/tI4BmpS4ZsvDWfgFFopNtr2AgdkvqVoNJKcIub
         vOU/3XpyZvly41wuziLBdKCk9jfWWinTXSZ4kGKMHK/RZPh2J4uiPsyRBVf1kcJUiOuR
         jAUKRWF4gzNk4cr4lzTDdu5nfAm4AJVWvSSWGpkEhxNrkEYw+t/JUkMkWsS8UPPRdl0Z
         8MVA==
X-Forwarded-Encrypted: i=1; AJvYcCVxV1wCmhLEGBqHt8aClYOJWzJ25vOuSEdoKRzcTCBeMsm8cb54wo4A9o11oHEG/FgDgYcfsnn9xG04@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7qYX3QR4glcJlNPFUZe2mk3SQKCTogVnH+ZpAO+xsIvChNQgD
	0zHU5YWYyd+Paemre3mI96D3TJz9eUMIqytIKy8fA6gv2wVRE7FHhEeBvea8pKA=
X-Gm-Gg: ASbGnctn8qibRQlIoPIFa+mR8bURkSZFlGOXMtjP6fsXjDC52KQf15sdH+EGo6u/98b
	ezp8ugOPh+pm2NiBmaFTlYZF7m8uCsCWYtp9WJ2tT5+qh+wLz+cIaztOjkJiXqvmcROQyUKQKo9
	MoVv7suJuo3uD1iNGYuFByib2ztw50TdQSEjHKitCTiNhpWexTv1rnzAu74t/1oCC0lZixJDQ/N
	hjy6gtrvgTvD/oNuBtj0hja6GClyAMtklkXE3wN87UlQHKTc6aNTf34bZ2Nu9hY4nqa7Ja+tLBP
	PW+EDOVTQoUfiTcJXF2vL81B4MO7eQTWg1Sh49rA2XcuzIi+NTxKKEOc1pY=
X-Google-Smtp-Source: AGHT+IHYo5ZWNOMKOctGcx3IT4yhd2NNp54tPQ3YePoiduR8lNWblfaka6Ofu9rG8GuCsbQdjLrzOg==
X-Received: by 2002:a05:6402:510d:b0:5fa:8737:387d with SMTP id 4fb4d7f45d1cf-5fca0759af7mr13997390a12.10.1747121492381;
        Tue, 13 May 2025 00:31:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d73fdd0sm6880355a12.81.2025.05.13.00.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 00:31:31 -0700 (PDT)
Message-ID: <899031a3-6946-4cca-b2e7-a6caa9f840c6@tuxon.dev>
Date: Tue, 13 May 2025 10:31:30 +0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the at91 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250513072951.192e1213@canb.auug.org.au>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250513072951.192e1213@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Stephen,

On 13.05.2025 00:29, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   7f0132d21261 ("ARM: dts: microchip: sama7g54_curiosity: Add fixed-partitions for spi-nor flash")
> 
> is missing a Signed-off-by from its committer.
> 

I fixed it. Thank you for reporting!

Claudiu


