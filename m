Return-Path: <linux-next+bounces-2589-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C0890D9BF
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 18:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CE6E1C214D6
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 16:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977A645BF1;
	Tue, 18 Jun 2024 16:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1jwmnCt7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128613C821
	for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729123; cv=none; b=a3FpCKpJlvjLuuXPWrTdFMHddGIR3ptBk8P5/JHnqSNw8dl40i0RmnyT9FAUiGPTnqc1hY0LljmmC8sAvpRSENNX4MR8xlwzYZbBeW4xa5dE8DdDo3Q71RUFZGE1yNZ4wy/V1blwEPcHvbu6n1YybZdJlMawpIcnudru25Ibuxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729123; c=relaxed/simple;
	bh=qXpD6byacZaVU5wfbDM3hcRtvuSv/sKm5a5TJYPgme0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zn6H2SjrNIEtmJaWXEUfQvrMCdUMtgIEQGfp/8mRCHGVaZ1iHBv/TRB3MOvC4LvaZ5GTbHBqL9/TwPrSPevkBPiI2YVYoJ2JanBWsOUlj2UW0lwT5JVowo7Acs2U8f4Y+EWxmBod9qevbEI9Wo5BNeR5jx9+qWPQTpOGLlotWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1jwmnCt7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so4986f8f.0
        for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 09:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718729119; x=1719333919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8yZ+1e/WZIRk35AOYISxgrcB4HUbGbQu99GQxuJf/5w=;
        b=1jwmnCt7B5DBRc6mqvdDHh4ZEPE5j3FX9tmE/zH9VQBxoFms1ze/ZlQKJbA3RHBBMm
         ucW+KWPZ337J26C6tPWAR+N94G01jouW7KvWjCjJV7mZ5A9X6ZATw/4jf6q/4dXxE57m
         D1HIDATEJKUf9uIkXpCOXpmaay9MV/xm90HLcYArhc18WRaHTF7OHY/821uHAIBDoIIQ
         OF/Ln6pAhfykHolLhek5WYU9SAHV+1H8selbTk2S08o9dvpoV0ztQH8kAJw1qLAmtPsK
         h2wFj0oUNCi29JQ3qYTlGZN9p2m1iqMgb+lx2TK1r/ux90h0rCrPXnYvuhlxLbe5GPCS
         tFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718729119; x=1719333919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8yZ+1e/WZIRk35AOYISxgrcB4HUbGbQu99GQxuJf/5w=;
        b=JfrHmeQ+1V0CVAI3xAEo1I/5ZqRX6ibOOcAq4/phdfRDIgv7R17NbPPFjGRd8A7H+C
         ZJK8wn612yyL5Phwiain6Ems2GuUQANpI2jPliZ7LoAf/9WI+q1k0OCo8IGjuU99/Dj1
         +CUuvdvFE65YtId855Uqo0sDUeGSrhhCZSFp5wKtk5wf5LKVUEOC+936Bj7+zty23+RE
         PsAnYa86ZrrnX+mpkuA3LOM7kvfn+UbcyychcXDFUcbNndQxhf8x7aebjfgEoJHBEUpL
         jtvhAbgHZfbOPlr5J5Dh4Sp4ltJG20f9pkAPMIBhXcCDJsNkX5NrOKx29FM7Pg3KZlwI
         U3rg==
X-Forwarded-Encrypted: i=1; AJvYcCX5Cpd7mO/XiUFeArc2Eix7kpR2nPmBPdb+gHuxFyB9deWoDD9CIefcq6x8fl7EYFfMdLmogICucFcrMUbcC1FnDXp4UD5uunigWg==
X-Gm-Message-State: AOJu0Yzub2zrNW7N+8n6JIFEsfzZotjLBqzLV4DwBw1WRzrL3nGkTFTx
	iFWz06bDAvHJqgdX+/775OBybRlftWDDR2gDJej/9lKYbrotLapyIdM1054Wf+M=
X-Google-Smtp-Source: AGHT+IFbxBwePI/OLNs/zJnVv/7CJjRYfCHxSIfPYW6UNHRUZrIzDW3h9aD2rQdbNiN5AA5U10Omig==
X-Received: by 2002:a5d:6b8c:0:b0:35f:b45:97b4 with SMTP id ffacd0b85a97d-3609ea6c44cmr2971980f8f.20.1718729119468;
        Tue, 18 Jun 2024 09:45:19 -0700 (PDT)
Received: from [192.168.1.75] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe92c6sm231037675e9.18.2024.06.18.09.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 09:45:18 -0700 (PDT)
Message-ID: <99b7f55f-2909-450f-88ce-8cbe8f41c7f8@baylibre.com>
Date: Tue, 18 Jun 2024 18:45:17 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mediatek tree
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>
References: <ZnBn-vSj-ssrJFr2@sirena.org.uk>
 <01f2ee94-f8b0-449c-aa19-3ee38a2e36a1@baylibre.com>
 <d87b7376-5ba2-4810-90cb-76648d4a8080@kernel.org>
 <be5a8b12-b042-48cc-9508-759a2a285a8b@kernel.org>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <be5a8b12-b042-48cc-9508-759a2a285a8b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/18/24 12:20, AngeloGioacchino Del Regno wrote:
> Il 18/06/24 12:03, AngeloGioacchino Del Regno ha scritto:
>> Il 18/06/24 09:49, Julien Panis ha scritto:
>>> On 6/17/24 18:44, Mark Brown wrote:
>>>> Hi all,
>>>>
>>>> After merging the mediatek tree, today's linux-next build (arm64
>>>> defconfig) failed like this:
>>>>
>>>> /tmp/next/build/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display.dtsi:113.6-121.3: 
>>>> Warning (graph_port): /fragment@4/__overlay__: graph port node name should be 'port'
>>>> Error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.29-30 syntax error
>>>> FATAL ERROR: Unable to parse input tree
>>>> make[4]: *** [/tmp/next/build/scripts/Makefile.lib:431: 
>>>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb] Error 1
>>>>
>>>> Caused by commit
>>>>
>>>>    d7c1bde38bf37a5 ("arm64: dts: mediatek: mt8186: add default thermal zones")
>>>>
>>>> I have used the last version of the mediatek tree from 20240613 instead.
>>>
>>> Hello Mark,
>>>
>>> Here is the explanation:
>>> https://lore.kernel.org/all/71d53ff6-fdae-440d-b60d-3ae6f0c881d9@baylibre.com/
>>> https://lore.kernel.org/all/6d9e0f19-9851-4f23-a8b8-6acc82ae7a3d@baylibre.com/
>>>
>>> For some reason, the 2 first commits of the series were not applied
>>> with the dts. These commits are needed because they contain some
>>> definitions used by the dts.
>>>
>>> Julien
>>
>> I'm not sure how should I proceed here.
>>
>
> Reiterating, I'm sure how should I proceed.
>
> I'm removing those patches from mediatek for-next until further notice.
>
> Regards,
> Angelo

Just for my information: Should we just wait for another maintainer
to pick the 2 missing patches ? Who is in charge of doing it ?

Julien

