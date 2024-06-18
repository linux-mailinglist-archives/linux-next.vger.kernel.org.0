Return-Path: <linux-next+bounces-2579-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E91A90C65E
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 12:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F0E71C21313
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 10:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D1013BAC7;
	Tue, 18 Jun 2024 07:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="I5iRKQed"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40EE76F1D
	for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696978; cv=none; b=afAKN2tFdit2rqn+Hx7uHC1ezCQTXic4sba/fPl0oS2her7/Q7g+/xp/5HDXST6ibXJYu+Ir8G9sNvJzXNJm/KKu8OSwZJjWMqOcU2+2XiTxfepWfY8t3oWuDOIeAonEYxdUjP68kMqyj4o3gztWAk+V9OEddmJcBkwYjBaO+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696978; c=relaxed/simple;
	bh=M6IjAQJ7uWC7h4ilG1WLKnCCSBc0hUV/buoGZiIOrfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYvEVDHJp3hII1Hl80xLyE4l76IYwzGayMMy3fe/gfbcdvLMOUVVljFhKMI1Ut6urLdxWPWy2v15mwWv66uYeucjAuWxdd7XWcSZKo4XPxNyZBeCJ3ywf6p0mj0UgRvXa7WWc1TiA9XZDYL61D9/ntr5wj14o6d5cwGUP4dUyLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=I5iRKQed; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso54383745e9.2
        for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718696975; x=1719301775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=slVhHLNHnoer2IgmxdtW2n42We64zqnTXEtmuZh6XNg=;
        b=I5iRKQedDIFFDJpbWTppdtVGZllCVr10lV9ML78jpGdOU98sGYNnRjyy/o/engNfWG
         KTvIn+JRb+RgzzDSFhLx2MzeWK85xVtBHrPz9hYZ/HXCTlH2rffk/UhsHn4nP7Paq0pz
         SDRt5tqoON1zBiWTz/3z1jqjAZucwbbsqInpi1GRZFb+WeI1GJLX33zMmnIyAsFWPepT
         p3bnltcqIUIdL+25Gfx2bcwgTsjWL8LctQfMP1sHi7EzkCJwaBHnD0TvfgPiTiEfSjkM
         +aRXueKxArEPBZE8zUJpOsn0IMl5TeBVHbywhyepHQDdsRZmcxWeu3K/1/E3VZD0Js8E
         XoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718696975; x=1719301775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=slVhHLNHnoer2IgmxdtW2n42We64zqnTXEtmuZh6XNg=;
        b=JhXpUazZngSkzlyh9SPiRh5uFdupLzsQD1enuNFpTUXIB8FruYH7CnOwFNELl7osds
         yvBEnkGNIOM4Vw7IroRkNybjEGFPMU2HmUUcdSLRR1kWm2JSwmF6R3u1YQUXr8NXxEEs
         XQ/xDqWsDp1Y5QoKOTQqhEObOTUptPLdyMWSGvidWRrpr5obUVhOYKcQ2Wjw3V11Q1jY
         kO675kQBzzsru2Qt3fHGgUBI8Z0/ZMem16WZNNCqgA88FQjO9sxfT60KfX+0ikK8ET8Q
         Ge5Rkmr3cnBSc77GPyAdnRbXSp4kTlc2VO6DBmkf9ZZyNi1+ZGQhh32OEdZ7V4XpYolC
         0AoA==
X-Forwarded-Encrypted: i=1; AJvYcCXusiv+NDCb/NfYxMvmcQp2K96BQeV5ksl6ckEKA8KVbzKCzsFG4NURW9J4u9/CAWr0LVL6stV0WSKiegSPQ+fINDcjbpEkVFz1Xw==
X-Gm-Message-State: AOJu0YzRtx663/a8NfpuqXhYNlLs3SonZluhUW+T+NbolrR3sNfTibW3
	7yw+RELyfXvw+DcM6iv6b3uEqyeVs0ExaLK2vfmf5lm78e8Ocs8vyTe62Bl9yjU=
X-Google-Smtp-Source: AGHT+IHAe9Sp/boX/61amtrpHaGVSdWp1zPS7L3crhK53BIAjo0hqkzbwsV3DM2DqDUJ03cDNj5hig==
X-Received: by 2002:a05:600c:4f83:b0:421:29cd:5c95 with SMTP id 5b1f17b1804b1-42304820b3bmr138531575e9.10.1718696974946;
        Tue, 18 Jun 2024 00:49:34 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe919bsm215819655e9.19.2024.06.18.00.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 00:49:34 -0700 (PDT)
Message-ID: <01f2ee94-f8b0-449c-aa19-3ee38a2e36a1@baylibre.com>
Date: Tue, 18 Jun 2024 09:49:31 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mediatek tree
To: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ZnBn-vSj-ssrJFr2@sirena.org.uk>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <ZnBn-vSj-ssrJFr2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/24 18:44, Mark Brown wrote:
> Hi all,
>
> After merging the mediatek tree, today's linux-next build (arm64
> defconfig) failed like this:
>
> /tmp/next/build/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display.dtsi:113.6-121.3: Warning (graph_port): /fragment@4/__overlay__: graph port node name should be 'port'
> Error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.29-30 syntax error
> FATAL ERROR: Unable to parse input tree
> make[4]: *** [/tmp/next/build/scripts/Makefile.lib:431: arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb] Error 1
>
> Caused by commit
>
>    d7c1bde38bf37a5 ("arm64: dts: mediatek: mt8186: add default thermal zones")
>
> I have used the last version of the mediatek tree from 20240613 instead.

Hello Mark,

Here is the explanation:
https://lore.kernel.org/all/71d53ff6-fdae-440d-b60d-3ae6f0c881d9@baylibre.com/
https://lore.kernel.org/all/6d9e0f19-9851-4f23-a8b8-6acc82ae7a3d@baylibre.com/

For some reason, the 2 first commits of the series were not applied
with the dts. These commits are needed because they contain some
definitions used by the dts.

Julien

