Return-Path: <linux-next+bounces-5078-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D94A0385A
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 08:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFBC77A1BA4
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 07:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D04219644B;
	Tue,  7 Jan 2025 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="VQW62G6C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D959145348
	for <linux-next@vger.kernel.org>; Tue,  7 Jan 2025 07:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736233478; cv=none; b=TqC1+jCZVhycVB9LPORl0kZDuRF2WBfgfpA4pcB4ffVkg8vKJR0N46fm/OZ7wgPAW7a15Grlf2/+2Et4mYUkSj7bMSg/f1K3WY0TPrrvEx/Ace4G65MEE76llKvdas4jxDwKbZo6MHoJhsTZ5Ur0bICUppI8NRWqH6dNmkkLt9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736233478; c=relaxed/simple;
	bh=Nc+fdT8LBIY0xmYjxumQraIn4UStgypcN7G0aFIRJd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HbIy/l4IJeDXDuMJhTYOFB5b95kboSgIbCEGply2wvjjqlzeQVKnc4X/5GU9uz2zZcyXHQUV3DS3YExWzUoJYwwwE+17eMmYvkaBOlQyo4zi8tg4YmQR8gWQy5FLiaMwCyMf+YJdWH4qcwQJHzbIrqBsMYA4WZe1LVZhknhwgi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=VQW62G6C; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-aa68b513abcso2815633066b.0
        for <linux-next@vger.kernel.org>; Mon, 06 Jan 2025 23:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1736233472; x=1736838272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pSxThGTSr3mzMBarugFC8FPBBG/UU0amH+phsAj2EgU=;
        b=VQW62G6C5F2qr37GQ9VmRO3/W58VJxv3z2bOTcNJihFep02RciC2XSCd/8rBUiUCY9
         EAmZs/xKt90qFALL9W1HGQt7dATXQNgKpGKceMdi8lPdeKvtVrVBTQTZMMraF2A+euKD
         eTnEklLI3HYrKmxZ9+2bYNs+w+jPLXjfTYX5a+yzlc1cfXtXdAxqaELfLtjCLpns7cnz
         3Zm6PFJ6uvrpHDtf67//Ro/o2m2kob1FmtI5Nobye3KlV78e0X/JuE/4t93pkPfceSd0
         VtPVpCsH6CxcRkOHEa/cLL6/09rN6TaifhZQeHNwHdB4EKKhiPm3nzEPDA6OF3/tK26A
         qB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736233472; x=1736838272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSxThGTSr3mzMBarugFC8FPBBG/UU0amH+phsAj2EgU=;
        b=ipkGYj9IhwOLdSJJ4fe1z3uloG54oUI9QQKxW1sSFldUiqILPAbimgpYKXcovtNSID
         JxBz4LTBFhrgMoiBUqUt7K2jArEkZ9JWvqaWoECedsi4bY1O6j6Rk74iSt852I4N3nvY
         yMdVZlIM8mu7NfCUG7BXRz9RWxyCN6flH02wXKyfOzMrP8MGgngnYYKGnxenNrEfJZvW
         58I02bs1tGUQJFa4jVLVTg67li7AMFH9jO9j34k29E8rKePTqXG59qdBZ7SW9THQ7ctR
         w3zD+8nD4/LubbkvdwjAwO/+SHKB0okrNIvaKBq1YRYe+ez0taL73Ao+VsKmRyvBwyuy
         O+kA==
X-Forwarded-Encrypted: i=1; AJvYcCU6fbm1EFZ5K/Rme8umpbdiFCHJz7+OCqDSV38i3i7vJXGtx1dNbw8QztmZsHHGbLtKqPOSI3n98f+4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1PaGNqwp4gw11a61LFGDKzk7Pzk/ESe3SXZ9cSEIxjTOnbuxi
	IfZzQiK4jHn5HpncHLWAtymu3xg335Staf+PbYxqH8U2lg6Y2nRS7HyLfkouTKwCF7mQDXkphNk
	zfWRIev/EIA==
X-Gm-Gg: ASbGncvoCvblsYWX2MwQAztvftonPHYOZ8bSWVRFmsXtwtBUfZfX8T8hNBu3Q17+FIo
	BeHMbSzbmS/OMoHzy8NrfBy7UPvzrTCKmGfUJb3Zv52OHBAx2foaiMuXuIXcihTCAaAvOxhV14u
	vmUKT4WgoUFvvkrHUN/lVanjs4WGbkxK+6NnL5YlP10sOl4k54PHs6+NP5/MYXqILAuG8o5aWrQ
	1XcBy6W+32+64NGBKIzQKe6nKcYC6uOgjpEYtu95jZ9hGyAeg1nbWE51FobZJn3EYyYpPLd
X-Google-Smtp-Source: AGHT+IEm5QMW+9NdY5cvJkSj4ROmPj03vfgJ7mYKjERwdDUxE40ZKLL33tlnFCfCqsU0xzed6F26IQ==
X-Received: by 2002:a17:906:7309:b0:aab:d8e3:340c with SMTP id a640c23a62f3a-aac2d467fb7mr4631737166b.35.1736233472377;
        Mon, 06 Jan 2025 23:04:32 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm2375988466b.127.2025.01.06.23.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 23:04:31 -0800 (PST)
Message-ID: <4a894984-4a10-4898-985a-2cdad19333fa@monstr.eu>
Date: Tue, 7 Jan 2025 08:04:29 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the xilinx tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Simek <michal.simek@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250107111117.599016eb@canb.auug.org.au>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20250107111117.599016eb@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stephen,

On 1/7/25 01:11, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the xilinx tree, today's linux-next build (arm
> multi_v7_defconfig) produced these warnings:
> 
> arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts:55.3-13: Warning (reg_format): /axi/memory-controller@e000e000/nand-controller@0,0/nand@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/xilinx/zynq-ebaz4205.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts:54.9-56.4: Warning (avoid_default_addr_size): /axi/memory-controller@e000e000/nand-controller@0,0/nand@0: Relying on default #address-cells value
> arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts:54.9-56.4: Warning (avoid_default_addr_size): /axi/memory-controller@e000e000/nand-controller@0,0/nand@0: Relying on default #size-cells value
> 
> Presumably introduced by commit
> 
>    dd6c610ac948 ("ARM: zynq: Do not define address/size-cells for nand-controller")

Thanks for reporting it. I have removed this patch and send new version of this 
patch.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs


