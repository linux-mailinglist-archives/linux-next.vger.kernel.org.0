Return-Path: <linux-next+bounces-4892-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C642E9E7A4E
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 21:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87D372847F7
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 20:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC7E212F80;
	Fri,  6 Dec 2024 20:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NFOVCTlQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CADF212F8E
	for <linux-next@vger.kernel.org>; Fri,  6 Dec 2024 20:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733518772; cv=none; b=OBH29xMlp0EIzyiQTpnOR82C4Yta8TJMkmzFgkib3LZ0OShHduCDdonBDUHquNspaDS4FEmM/Sk6CWN/WgmlrPYNtgiX/EEtbSqd0cuxIMhV6h1r4Zk99QHtvVo/09Sp0qgMnHT/xHmGRWKd2ZIkZhOTDnSOu/Gfinn2L5ubOJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733518772; c=relaxed/simple;
	bh=sFTEoZiIRb74YRwsa7ttXY8ZHVsRpVbhOmwk5EGf/Ms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BS+JWYDxYQ7EKud3mhihVFtttxetCue7lJzIETl9yscL5P5XtYGKXR8RszlVmam2ELlQwHjR67k8MIedeMtkp/h3DMlpAOWdQnrkonjAHwkUh2GVz0KeiMPReUPKU0yJaXG5bM0KS9OGmvp9UD2B5bL+0GXtqz+aXzb2w6cTGxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NFOVCTlQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21577f65bdeso21161865ad.0
        for <linux-next@vger.kernel.org>; Fri, 06 Dec 2024 12:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733518768; x=1734123568; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=va4dn8D1CKo6xkSMH2d1los6O3n2OYurOtJJXORdG5k=;
        b=NFOVCTlQ8mP2fuxmNmFiv1FLm+2giVtVyrNj+PkqwLtlmuQpNc+WcswF3d8n7kjwlx
         WpmUtgMx+125+dUEchEaGpaEF4cYR/b0k82sS3q+tsp3BdlQU1KpJ9MmAB7arsOaovlg
         oJUubDZxBv3g/j50+DUYpDsmVidTfWBHmKN97pQbuDSj/qvEKc7iDbd2njLTND9N6G2v
         dn/jAhJNDoZoUjtyh7S06b/OEw2SpAkQq/p8Pob6410T0bSi9Ek1EUXGaIuddMXCe3Rm
         VBNF8FB+wFWQJK73L/HEo+MRpoOWahHE9pQSkh1L9DmVOcN46C2WFEq7pbuzsYbJN5aG
         WzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733518768; x=1734123568;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=va4dn8D1CKo6xkSMH2d1los6O3n2OYurOtJJXORdG5k=;
        b=T98rPlFkpp/6fvmtNlDu2rF0JBiypqZC+mRoXY1msvJFUvOYdDW0Jgs4Uk3D2B0niO
         nChjX7I1xHgQphczfG5CEAqC1sCtwDWACarYk7Awt6AH+fXneqWpGBwQBzj2fAdS8H9i
         vDbT+A7BmYjxEn7mMxAagCADEfl+VQ1f1uDNA3mUXI451lD7X0pWwSW2KT5bKVw62V2D
         R1tqGgquFaSHnnH3REC0EcVKmtFn6YotjOaFbb6dBwS4AwQPTvXleyQDOixGopAh/ZEt
         Tp+I23RIMZ5uPqhgzqXeDoi+SE6a9qME5E8zZoMBrEA0VO8TnCrMlwNAW86/H731JYe8
         Nv1Q==
X-Gm-Message-State: AOJu0YzQsvh/9xT/KepvJOSAuA88ww7tWHtqrRAJ2YIBUlfXszLNPtVY
	kFR9PGZ22+CW4VzzRpsCZzKhKfHsrzOCD9xMe6DrgUbL5f8x8BVam8ZnwX+bcZ8i1TnGcSy87BU
	lgDw=
X-Gm-Gg: ASbGncugEndbL01iNSW2m9UYg63AR6eZXaPLHNLeAhCipnnC74b4d+vjXBgPMtCWE2I
	9Pt6Jy39DVcW4Ud/OLPWfKaXI/VTAp5FMHYMKxuwndwJHnOVUMUAPoSoDyiDJH91s50SpyiCadL
	6ayeHw9Lkr3ScabnUQM8+AfuW58jbDaPP7VRkwgcqXl1SpG9k0xqDnABZyQhP6tC1tiQ6tnWY4k
	lVgjfOhBkSE8rJZzUoiEpxss2IhOpYRB+2aD+Fo2Geutv+m
X-Google-Smtp-Source: AGHT+IGjmbgjRlHwgUy5dqu3m9WLv/C5AHugjdkoTmODIAGSVzCfeuPtTKibRJAccp/LZuc9Ycy9JQ==
X-Received: by 2002:a17:903:94f:b0:215:a6df:2969 with SMTP id d9443c01a7336-215f3ce4f28mr141283065ad.17.1733518768644;
        Fri, 06 Dec 2024 12:59:28 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8efc8fbsm32749055ad.145.2024.12.06.12.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 12:59:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: Re: Missing signoff in the OMAP tree
In-Reply-To: <87c2f4d6-2c51-4410-ac3e-764c2cefbf30@sirena.org.uk>
References: <87c2f4d6-2c51-4410-ac3e-764c2cefbf30@sirena.org.uk>
Date: Fri, 06 Dec 2024 12:59:27 -0800
Message-ID: <7hr06kfryo.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> Commits
>
>   93dadbfbd19fa ("ARM: dts: ti/omap: gta04: fix pm issues caused by spi module")
>   1d5e14a20dc60 ("arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1")
>   d8efc0b428856 ("dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible")
>   08272ce1de633 ("ARM: dts: dra7: Add bus_dma_limit for l4 cfg bus")
>   eaa64013ad85d ("ARM: OMAP2+: Fix a typo")
>
> are missing a Signed-off-by from their committers.

Oops, local script fail.  Fixed now.

Thanks for the warning.

Kevin

