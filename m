Return-Path: <linux-next+bounces-2590-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 089B490DA55
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 19:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4BA728179F
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 17:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6898713B7AF;
	Tue, 18 Jun 2024 17:07:33 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976CA47A74
	for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718730453; cv=none; b=Wgpj5hublERCQe7edx5HqWcRRT9d0DzKzFuJl7xJX4TP+11K25VB1gVSulp3I53qB7nm/zZJ/rRwXA55FEKs7+RVVXkRE7VFFapK+BKli+H4U3w8oVJdFjkXNpFnHcaih+2g0fhEDlx8IicWCyvCSab8gvEAFn7cKZUfEKTaKy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718730453; c=relaxed/simple;
	bh=TKNQ8t8Th5bx+OdQANjpXoFO//f8B53gmdB3PVMUVf4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BpUUYDJnDVi3Q/r468j/1rfMkDzOQDOHb2zt8atTAzNqvCO/1QQ+Eh588xEk/VQPdfHlNYsZnxcVjNoF1Hb/Tm3HmY9iSKwRbwpmNXfLz035jsiYYthkk7RMTf/65a7vN+RwbLNDaYvUlMgjJAEzQzcBOrq3RtS+x9yx4MnzmE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7041ed475acso4468148b3a.2
        for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 10:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718730450; x=1719335250;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKNQ8t8Th5bx+OdQANjpXoFO//f8B53gmdB3PVMUVf4=;
        b=OrHKaZRNvIObEsfQupBZN42N28ezNRkgVWigZlNW2kZ1jkOea+CjAq0FFLcTLjQLP5
         AL+7dd3bF8faj2qBLmT9mtRgDt1i1O1keJA9psszbJcmFcqEr4M5HieFd8V/ibr7OgXe
         xVdZZlZbdZQ20p+coVUJuPTa29lSkxBWbdV4a8+ThCTGo97JCTN1GyItNnf7muGvwCZq
         l1JqIRLIj+//QSKqhFv05M1E2sV9B9pk/7CuNVDSLEsFgMC31Ncg7e1KkkDka/497um4
         z52cwHpiLnaXoW+S6D9tVQvfVT9zJVdZMpCVJKynLtapkIbu18Yu8Oebbxqvr7tGyOn7
         rBqA==
X-Forwarded-Encrypted: i=1; AJvYcCUiusJXUVB07HNst3PuXiBplpdFfO/ne4XELBxxwiDbckS8t23Nnp7+C+BhvgVZPMC9QUdr0xJ4gbO4hEEvC75XPbExKKVwcoqgmw==
X-Gm-Message-State: AOJu0Yw+6juNATc1T8F5GN3OZ/KinyGuhOOCep63zB8EDhxitPcQ9r0W
	+0iGvhMG3lBrglA5CWtfaU/IDb6r0MogmPbI7voXBDErH1tB9lHmSYG+e4p6HX0=
X-Google-Smtp-Source: AGHT+IGvLCeVcnRFysSRDpAPuP+5+YgRu7qxdI0CNTvxRQj687g3cRH32U5+Tihug8EFyoKJyHk9sA==
X-Received: by 2002:a05:6a21:19a:b0:1b2:b197:dcaf with SMTP id adf61e73a8af0-1bcbb71e786mr101516637.57.1718730449953;
        Tue, 18 Jun 2024 10:07:29 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc964acfsm9176834b3a.45.2024.06.18.10.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 10:07:29 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>, Mark
 Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Julien Panis
 <jpanis@baylibre.com>, Nicolas Pitre <npitre@baylibre.com>
Subject: Re: linux-next: build failure after merge of the mediatek tree
In-Reply-To: <be5a8b12-b042-48cc-9508-759a2a285a8b@kernel.org>
References: <ZnBn-vSj-ssrJFr2@sirena.org.uk>
 <01f2ee94-f8b0-449c-aa19-3ee38a2e36a1@baylibre.com>
 <d87b7376-5ba2-4810-90cb-76648d4a8080@kernel.org>
 <be5a8b12-b042-48cc-9508-759a2a285a8b@kernel.org>
Date: Tue, 18 Jun 2024 10:07:28 -0700
Message-ID: <7hcyoekwmn.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
writes:

> Il 18/06/24 12:03, AngeloGioacchino Del Regno ha scritto:
>> Il 18/06/24 09:49, Julien Panis ha scritto:
>>> On 6/17/24 18:44, Mark Brown wrote:
>>>> Hi all,
>>>>
>>>> After merging the mediatek tree, today's linux-next build (arm64
>>>> defconfig) failed like this:
>>>>
>>>> /tmp/next/build/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-dis=
play.dtsi:113.6-121.3: Warning (graph_port): /fragment@4/__overlay__: graph=
 port node name should be 'port'
>>>> Error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.2=
9-30=20
>>>> syntax error
>>>> FATAL ERROR: Unable to parse input tree
>>>> make[4]: *** [/tmp/next/build/scripts/Makefile.lib:431:=20
>>>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb] Er=
ror 1
>>>>
>>>> Caused by commit
>>>>
>>>> =C2=A0=C2=A0 d7c1bde38bf37a5 ("arm64: dts: mediatek: mt8186: add defau=
lt thermal zones")
>>>>
>>>> I have used the last version of the mediatek tree from 20240613 instea=
d.
>>>
>>> Hello Mark,
>>>
>>> Here is the explanation:
>>> https://lore.kernel.org/all/71d53ff6-fdae-440d-b60d-3ae6f0c881d9@baylib=
re.com/
>>> https://lore.kernel.org/all/6d9e0f19-9851-4f23-a8b8-6acc82ae7a3d@baylib=
re.com/
>>>
>>> For some reason, the 2 first commits of the series were not applied
>>> with the dts. These commits are needed because they contain some
>>> definitions used by the dts.
>>>
>>> Julien
>>=20
>> I'm not sure how should I proceed here.
>>=20
>
> Reiterating, I'm sure how should I proceed.

You applied the dts patches but not the bindings, resulting in something
that doesn't build because of changes to #defines in the bindings.

Both of the bindings patches have already been acked by a DT maintainer
(Connor), so you should just apply the bindings along with the DT patches.

> I'm removing those patches from mediatek for-next until further notice.

Rather than remove the DT patches, you should just apply the bindings
patches.

Kevin

