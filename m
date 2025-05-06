Return-Path: <linux-next+bounces-6546-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A24AAC0D7
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 12:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E854F3ABF56
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 10:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A222701BD;
	Tue,  6 May 2025 10:05:31 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675042472A6;
	Tue,  6 May 2025 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525931; cv=none; b=SYg/zCl/zivteILExmwskvmu3hkbZgi7BiThePfZK4zRkanj66M5oKy6tumFWB+AT4Q8RdQ7qrSNnqiQ4JiFY301ZonyRFVAVI2VSiL5cGIP9c5M0y79WxngqZJ5xlu+YM7q6A54B7zvGjXdP9hpZR8eP4y/Kvrn8gEcHRV1OZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525931; c=relaxed/simple;
	bh=Y/VJEvoHPIW0rBkteoNkuC/NEVPFSr6JkPZiPbFtmyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDi3JynWo+6g5Q2oMlXQ+Y2LD8CYylPguZQE7Q07TenJZZKNIW6Ceyyb3YgC6OOiqrWBh02+g7lM2QExfkyNdlR5SnCbb8mFP3Hg8oJ4zs6C06KZhi8DYK5oP+/p9RRNAaW0vzbk7NBBKt1oo5XS1xJMj9tQ8zCjK9q9HJxv7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4c300c82ca8so2492145137.2;
        Tue, 06 May 2025 03:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525928; x=1747130728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UG3EfZcOLsg0K2Pj+i+A07ZZOxBtuVqezBnYYw52wU=;
        b=kRShi6GGW3jg7xoppRUQPWakgqEcFj3RXQ7xKZu+LQzgoVKDxqqLfkFyz4Z0LHLVHt
         ZbpYOxvVPb/qNQ2+P8Jl15UJELCKUhhwQ/zbZ8fiOtRm3arNVP4/q6U92wb6bBXGY4Jp
         JZqQevJvtndu+R6Kjr1SwiSgH/cVraKAuuLyZ76lbLyV9ymilJvhFFKCOjzRjRhcIKdt
         pzGT3yA9nS7aBwS2m4Ou6OmjoIhmC2yB+QX0k24YJf19Nxyc2bx3Ug/2sG1V9snSeTzh
         Uy2bxDs+gvXIxH4O+vZpLEIxh5K3EY5RbOsrvgoOCyES+wMcQtpntT+fu6h6yBUdJdEC
         hVGw==
X-Forwarded-Encrypted: i=1; AJvYcCUlTM8jBYOyFAfncV4aNcABHBf4qO2gLu7P5tfLmZ/J2tvwaO26NiwmTFh6UFw2qZ5YohbtB9IQIRMzbYYXhQx2t4ZJ@vger.kernel.org, AJvYcCW9ReoU28klT72adeI1c3iR2j2gnhcGdvBnrxhI3/2g1SSMGFryfXG8rZMRKjvkyRtjFAIBjK5KU6G7mSBG@vger.kernel.org, AJvYcCWrLasIwvCWj4XAg1licZQ94wU2yJcGB6BLPHPLcTskGcrYW4T05dXbUvou6qUnn5FJ/Gf15k6vvM3jQg==@vger.kernel.org, AJvYcCXOs1KSicseaCzHPyb/u5fnOVyJUAWkXLkU+PrmDvq3VnbDRGfEw+qhJAkHmWOGp1r3J9V0EHv4oT9tow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN2nPDBX98jqKDK8yGYPXF3sFdx0QwbfHDqNOjfVPcfRBIfK71
	XBjEfZIokYhT0vUEGgRVmu+BnoeJ1Y4qLvX4DVdioovs2BB3M/gIAjEVd1wO
X-Gm-Gg: ASbGncuHPrMEhixnFpzQZDrLPq69UrZYhSb6o7UkSOIKPqPAmeiJbXQsOyHNgr9M6PY
	mB59JaOJlcP+FTPDx00hjEqE8vJa3mIz99mDNJhucqjObk/2i5ChMeMqF/eVtRJv58lzqBOQx7I
	HMOJxU6Z35ct204LgImUUViRZdu3YSE5nZYjk3G7uDsMjXrPWuJqXQKBj17WZBm3tM7WuRPxSMs
	nCZ/M0Zpwhv+tJvtBTQyt4CvOmcZ9yDgDrW6dgEpC591YvYDuBJWkUjLyRw+Py0x9ScuChvlHas
	L4TNg/+nLs66B4rkscW+MnpoFrUrBfwalJlQgfmC1jpFhoCIcpx7LnQocBiasqOs8dqW96cXkcG
	1W48=
X-Google-Smtp-Source: AGHT+IHBxz5YxRzrWKsPUbEAjQTOhgXM8B51fDmfN/v8qSvh8VsaBuNq2xzqM6v5M2reFOB7enLsjA==
X-Received: by 2002:a05:6102:570e:b0:4bb:d7f0:6e70 with SMTP id ada2fe7eead31-4dc637871dfmr1259086137.5.1746525927881;
        Tue, 06 May 2025 03:05:27 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8780b293e9csm1587177241.31.2025.05.06.03.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 03:05:27 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4c4d8638e07so1566640137.3;
        Tue, 06 May 2025 03:05:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpsIi94uwQcRCXF3JgKWY97+eqmk5e/Rsi1UmpPaSTONqensyL4WoHj9tXlBa8ARZJJOIO0RN3Q9dTSPYV@vger.kernel.org, AJvYcCVPamFT5dqKDZQH7XU658KcoEX5gGARVg69Jtwd0aKprL8gy2iE9C/3MU+SK4BynfManw4FiIos0sylUpqsShmsnFKW@vger.kernel.org, AJvYcCX9tagiB7/k2W1jkvAt/Z8U6vY9W0t6hvMdB31LdnbUTMtM+ccfxBcoiL4wfYVqQOPBUjmtRvhBfVWPfQ==@vger.kernel.org, AJvYcCXbIJ/HdQf3MjruM9UjjgNUesI7p5eNtVDHkMbIqedbGYZZ6wpr5g+EMWWNvE4Dm+wrKvzlIwtAu3aOVA==@vger.kernel.org
X-Received: by 2002:a05:6102:80a8:b0:4c1:9780:3830 with SMTP id
 ada2fe7eead31-4dc6394b72bmr1710089137.23.1746525927504; Tue, 06 May 2025
 03:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506192033.77338015@canb.auug.org.au>
In-Reply-To: <20250506192033.77338015@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 May 2025 12:05:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_K7EA4kE2mqxv+BkfR_oQmcpek2B3LxiYxMjSMfwjAw@mail.gmail.com>
X-Gm-Features: ATxdqUF28lBQNyrtXWNX6COscd_3GGsL2n1KwNeSKx4aB74xPjE_auRQsV8ugSQ
Message-ID: <CAMuHMdX_K7EA4kE2mqxv+BkfR_oQmcpek2B3LxiYxMjSMfwjAw@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the renesas tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Tue, 6 May 2025 at 11:20, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the renesas tree, today's linux-next build (arm64 defconfig)
> produced these warnings:
>
> arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
>   also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:463.9-478.3
> arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
>   also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:463.9-478.3
> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
>
> Introduced by commit
>
>   c29748ccad88 ("arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound support")

Thanks, this is a known conflict between SPI bus bindings and dtc:
  - Serial engines that can be SPI controllers must use "spi" as their
    node names,
  - Dtc assumes nodes named "spi" are always SPI controllers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

