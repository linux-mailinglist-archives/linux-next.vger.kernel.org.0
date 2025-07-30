Return-Path: <linux-next+bounces-7768-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C301B1594C
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 09:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FEC47B1A52
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 07:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CB01F4722;
	Wed, 30 Jul 2025 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPgmkXvt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8C1F4262;
	Wed, 30 Jul 2025 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859244; cv=none; b=M2zhGmOyEiGypP9lF9KLM5s77pb+KVuDvKxxDsfpQ2ilmNiWio/xIeO4N4KXERAYSyBLJyc0l9TCVCiYmCpamvE+rVgb0ZRK2TxRTahrWc+7cbypGLCYlF0DR1rqKCl9QKQ4PoT/tv8apGZ8EuGN0u288MpVtVB1rA5gXVFJNMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859244; c=relaxed/simple;
	bh=Pm/Lk7KfQs8EoJ9U08KtR33aU8MhOt7Yk/fgpWoRQTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf8n85uCRmo+/ygokfevPVghvmNYUorCpbzbjnK8m+/vWkWY7Z3DwHfhE5k4IwHhmZRvsmk4TUCrI4T2V5HrBHoRgRYuJL0hTrZeUS8V13AE4cMzBKu4HDCjD6kbj5fpk9zMwkq0MQZAmWkLaQPoxdR+5jpAjQcY+BfYRroLcqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPgmkXvt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45619d70c72so4007825e9.0;
        Wed, 30 Jul 2025 00:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753859241; x=1754464041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bzMP7jHlifnf/IUk+jkMokmhgg+MOsQ6pZDOdnVvcQ=;
        b=dPgmkXvtYfkYicclgXlHOQ46YRffihL6AU74g2kZaxD8qzN/iDKpKEXFGgv4RsDtqm
         t3YaN8Ye+s0ne/o3EljtfVJstZDHnWOVZGKPhxvdKpC+BfCs1ae7EglyeUm/yKWFAkNg
         AGvhawfOvMFkSjvYbQrX0dchW2HvhAE5J0XSxDPRW/InX18uwUPtaVBx6asVzAnKP40w
         +nvJzPP3kyBF/wskQoslTXLu0awUceiaaLfJfCJ3AXeBoQdBR6fOui0amYgmRe71HnB6
         /T/MLp0v7ZaLYtWPCSDvnSZVdfWQrYyHq2BOVLczr8w0HNB02Y3qtnauC2k+Ab8SSexy
         c3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753859241; x=1754464041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bzMP7jHlifnf/IUk+jkMokmhgg+MOsQ6pZDOdnVvcQ=;
        b=d3ny09RZI0fUfpbiSxFosgdGNhzsJ12uSYrbzY3JGAxZHZVA236VPdBFnkfKkCrO1k
         IJ4mcRC1FGuFNWs8h/D1Q6oWwdPb2rUQnSM5EOqLVoPBSoL8KfDuUeKoPcOCcZLzYtZN
         kyHdtnQRn0opYaP7AMfLN0k9/BqdaFeDTwwc5W3pp6E7F2PIfo5Pnae4ua9aSxD2qiZ7
         ArqVwNkgzsMgE6WyA7/3CUDP+yJLuC/HcxbtHljEWttNK/gIdCBIITYNBy4Q/5C8I4x0
         ZxpJuMMeBPaj6xmgUQg4Pzxhv5S8vYA8YQKNDpVM79ObuguB5RtC8KhFEjiHe3Z37E3C
         lxiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw/5n40+DyN3KpW39B1R55ywCCnFZM7kpqbksmwiaLOZ5S/fwOXOPSo2j3Gh14+9n6RGrJRdY2gfDEfQ==@vger.kernel.org, AJvYcCWLY6HGLznUjfQMPStcRf6L6y0zLh8Ig+vlFH4z1S5+yXFNciag1IN1Bwd5FbH+tYzazLxoEdLo0wLJFLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YygOiQTlfYpd6uICi+ajStEhHakXo61jOOOAHbvqhjmLDKHije6
	8xac2/3G+hU9vykI8Krp5pf0rD7O4LwVjzxopeIKsGjY0TfBUO4jO8ku7Oujpw==
X-Gm-Gg: ASbGncsp9VrVoo4/GGuj8D3O1aAEmcvY3aKKd7H/3hq6eEzHagbK4dP+1xv4HpFY1bG
	GjP0Richy89+8yYqGrDSAiy0eRJMziqF9llQbzFdYEiokyuz1ZhOpHT5lw0vOXgSjMzEh+K+gzw
	FRzpmzG7MvsZDpP3cbercAbYmXy4W8SepM6B7l/4RVW2j09sPCuJGsngPDuRzs0UM+gMEWH5TKS
	Er1cGkr9jjrLE7KijY7ALEjsr6pDDodN8cKEa9BkFlkIH77SOykw8Vle4NUuJ2+JcbW6gmKDeXF
	bQVZXnjZUEFWt/bEMEHJw71ZeaEgx8G6uLhfsX9fmlxSYnFb8btZgm6zfxnCV+TsSVMiPhp4TcK
	n3qyNrzQiAMja+mGrH4wHv3914SwhzM9RsO5C5HZBzV0MmMohWfCI0DhdE5e0v9A=
X-Google-Smtp-Source: AGHT+IEJD06z10thlRARh4WWU8PZr93VuhL0pqbokieheNEtOo4bweOlHodmlnZFUrAnO4PUik8I2g==
X-Received: by 2002:adf:f009:0:b0:3b7:8f49:94e4 with SMTP id ffacd0b85a97d-3b78f499706mr3285222f8f.7.1753859240859;
        Wed, 30 Jul 2025 00:07:20 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b797fc5e3esm103899f8f.69.2025.07.30.00.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 00:07:20 -0700 (PDT)
Message-ID: <4cef0788-e586-47af-8c2a-5d3c87ae42cd@gmail.com>
Date: Wed, 30 Jul 2025 09:07:17 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the spi tree with the nand tree
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250729103816.5354a528@canb.auug.org.au>
 <87bjp3pawb.fsf@bootlin.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87bjp3pawb.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Miquel,

2025. 07. 29. 12:08 keltezéssel, Miquel Raynal írta:
> Hello,
> 
> On 29/07/2025 at 10:38:16 +10, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi all,
>>
>> Today's linux-next merge of the spi tree got a conflict in:
>>
>>   include/linux/mtd/nand-qpic-common.h
>>
>> between commit:
>>
>>   8e37aaf97153 ("mtd: nand: qpic-common: remove a bunch of unused defines")
>>
>> from the nand tree and commit:
>>
>>   0dc7e656ddd5 ("mtd: nand: qpic-common: add defines for ECC_MODE values")
>>
>> from the spi tree.
> 
> Indeed, I forgot about this change which conflicts. I'll drop the patch
> from my tree, it is not urgent anyway. Gabor, please resend after a
> rebase at -rc1, sorry for the extra work..

Sorry for the trouble, I will resend the patch once rc1 gets released.

Regards,
Gabor


