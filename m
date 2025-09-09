Return-Path: <linux-next+bounces-8247-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9CB508F6
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 00:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F28661BC710D
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 22:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C5A26D4D4;
	Tue,  9 Sep 2025 22:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrihJUNS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3365F24BD04;
	Tue,  9 Sep 2025 22:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757457865; cv=none; b=rnAoqVUNYmSenkPVMXWHEdgsc/yhEOo4K5Yp/exiIhsFPx4DYgvQ5eZWVsHcoeAT3fslhSwZn1g/bX4qXDmRp+gIKZc7vGrdrXQoOqlxf7TbqSJCA4XkOpBWrr/UFabP/cDJcE2kKeS9p8B4514gpZPBqRO/42JxrW/NUr3US5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757457865; c=relaxed/simple;
	bh=mHOW0pMk6jXzf0q9hguFi3MmSKENuF1wCLmMMrRosro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VkjRqwMjzV3TO3KLDHtOEmVzAFED4pqlwdhQuZfvdoWWybCY/0/wrd8O6UMK4RP4tgnGdog9ND6SiqtNZa80a6aENs144LtL6a+/2uOLh8waucAIVKQ3ZuV4q3o2yeHWLgaEIpZrUUxYX0/1CvkosZlqK4pdnaupMeaMD/1tAds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrihJUNS; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-72631c2c2fbso65763026d6.1;
        Tue, 09 Sep 2025 15:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757457863; x=1758062663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDhSKvwOmcaLxH03f1pk2vtgPBVH47yS/bZ5KVlu6Vo=;
        b=mrihJUNSErSdzPU2+UtEz3KCf2uz24pw4GxtnBwSmGbBEKS+opypnXC4nyhu70VNCy
         UeMfipKFhRq0nbtVh0kdT9vKsDj62/aHqojR1vbSgfKVnlJ/8TDS9lfv1zb2K8wjuQ+B
         pJ/50Vki+cLp07IhkmPGNanfrHphnzLGigeF8AUABpXFjHS6vG9IzpY5toKvD43SJbhd
         wwMYIR9Pc1Vnb+kreIrMKpO1n9EPx48WQRcj+xVssdz47+QydttJXGtaA+0K0KHqUD1o
         4kADHJts3LLKEx5145Z5/QenY2LkSrjFuAxlJUqSMBPlrlhal4NC8XyPbIM8wyDRCgLQ
         qNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757457863; x=1758062663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDhSKvwOmcaLxH03f1pk2vtgPBVH47yS/bZ5KVlu6Vo=;
        b=rqEjbnZ0wcN6S0lsaDbk6/SQBQ0m4rphezsFGP/LhpDQStXm/XmOZ/ZbNRa7eappEk
         afa93sd84lmKgLGT9KY9ufFJ9pL1/aTFqju2aga06WyJ/1/9uY0l85i5oWPeCZfKjDoW
         xz5nsiaJU6gLgehvodlno0lwPdfDAAqf55kQeAvdUsC6CSSM1BhZ9E+5CSPcV6T9nL+J
         +vIuluV9+72t8kdJnm47rMPY2hVHQHC3+5GuxutIvC1Xg2xQuI4BIuT1+9xayPKftAAr
         p7+YBu17YZU4gpulKUcg1agsV+stnF335lzE7c7xxkInrvURqYM7FAcpA5iStfGvA3ZS
         HvhA==
X-Forwarded-Encrypted: i=1; AJvYcCUMBgKKHO54FzvLQxNvgU0/9+IF17CGmHkoML3ZHAP3vtEFC7XRPCkfEBFNovI72ZLdU1oBtJ7Xf6Drfvo=@vger.kernel.org, AJvYcCWVO9KNyI8uduyh5M9du2tLrMhskApU3qNePDY19Lsz/kqo1/y9CtEKYDFjud1vSUaqxszYAqWpez5fcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzPujYqqr2naAonhuS8mKWOzokbMdlnUqr6e8SZttsw/oNKfqM
	FtPL+TM6NkClr56S7FhSuBE6NsFqkaAlLtIX5ck4QSJ4eyWp5TwilmsC
X-Gm-Gg: ASbGncsRf4cHRqM3BmvZhIl7ViJkKcQt6s/rqpaaLbOuhDnrlLyUxbPIoVUQqWVIjZD
	sUvmBPWkVhACtvieuBwAFTCPhLc5eYky8SmCFRn4EM4yZfYC3U/C+CO4aksh+dwWJcQCdQ+I6Uo
	COuIbe8sCKM6nTkf63V3BGvhU+5gIGecIe4xeXxaQJ5adUsZ+FFntNL6EPnHS0SI7OWtSKq+Nt+
	1USlQFHunK9bOP1HW4+eqPu1uWUH4Z27v6vsn2Ofsff7sAckXzxjQk5nTdrRsTVv1U2FdU6t/IV
	mkc4aBdcipVraNqhOcLCzR/tBQNkjEnJWrJiixdN7q8qzLwGK7T3gJuq/1gIF73b6umektJq/dd
	3RWkXnjCd7GtcW3jbImHOkb3EITtsPhGECOpcQdwpd8co7EzZCB0HDgewWbx+
X-Google-Smtp-Source: AGHT+IFftb/s6C99gnlarVoH+qdpuolMtVHzqbJlBSqjc/snF8vYB08V9lXx7WoABVfHLRj6HTJuRQ==
X-Received: by 2002:a05:620a:2954:b0:815:6a98:a1ab with SMTP id af79cd13be357-8156a98a43fmr1267976485a.70.1757457863073;
        Tue, 09 Sep 2025 15:44:23 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b535deb92sm191239185a.0.2025.09.09.15.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 15:44:22 -0700 (PDT)
Message-ID: <4ba5dff8-9f07-4750-8f42-42f885646964@gmail.com>
Date: Tue, 9 Sep 2025 15:44:20 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: linux-next: unexpected files in the broadcom tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrea della Porta <andrea.porta@suse.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250910083713.4c5ef7d2@canb.auug.org.au>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20250910083713.4c5ef7d2@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/25 15:37, Stephen Rothwell wrote:
> Hi all,
> 
> While fetching the broadcom tree, I noticed that the following unexpected
> files were present:
> 
>    arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts.orig
>    arch/arm64/boot/dts/broadcom/rp1-common.dtsi.orig
> 
> They are introduced in commit
> 
>    b00f5cbb7abb ("arm64: dts: broadcom: Enable USB devicetree entries for Rpi5")
> 

Now fixed, thanks Stephen!
-- 
Florian

