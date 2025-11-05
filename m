Return-Path: <linux-next+bounces-8826-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E4C33A8D
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 02:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BFE2D4E533F
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 01:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB2E2475E3;
	Wed,  5 Nov 2025 01:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FK9N7yKW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCF4226D14
	for <linux-next@vger.kernel.org>; Wed,  5 Nov 2025 01:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762306112; cv=none; b=Jugo1vcoN8oJK/SiSKfq9IKElMssaq1L3bevHAtjDfMWliOYuMkit/JKmytRxwggymJ6vfr609RW216uUWbyWyy46KWyawEkmJu/eGqxpbOHJqJw5teU03aT7mfE3+7n6JbDu5IouKmlvl27ZutaqiVy89GMl7I5dNj9BAn8H5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762306112; c=relaxed/simple;
	bh=qNZOUx3FAp7TY7xgqzRZ+MDKI+Wh0Fr+MDjZGtR8ru8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r52lTB4JXN53dLzvrwdBVw98/VwaCsuA0IhP3myk14Y911+fxIXRnG+bhCC1H56BDZ+HWf7Y73HHuLn8Wp+mvWCjS+N2ZxS96oif4UOl++eG30hX5Ce/UTDuAVkIVaG6HNFoA7rXHbaK1TrEWQf9DobONEcVbeVsMRxtHHKE9c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FK9N7yKW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so372691b3a.1
        for <linux-next@vger.kernel.org>; Tue, 04 Nov 2025 17:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762306109; x=1762910909; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPPUewGB6So9V+6so9jHVW4+5E6VBrMKCWD6USZE7ko=;
        b=FK9N7yKWZ0c+TzCxOWPh7MWt/B9AnBRt0g/uNLeWSMKzJy1PvNHEZ71ngKTJdT1ZUJ
         pPQE83OdfoV+rmX1MsHmtWpHD9RxjtGyvl9UqYpLdgByr3A/6bYhoK01XxF6JgaKzysu
         5QzrkmDW0lG7LGXAcM771Iv2OxETtZb/1C/n8u7wU4FeEhMAU7G/c6B95utfgSvVuRH1
         92g4b4JmWZByADWzmr7IJcDk5ccKQriswyNcKxr/IFeNjSqYBncGwq/BsZpVT4QlogYA
         slKSjkVPnpUud5r4VM5TijD/nJPtUnfy1LQyjN8ozeUmQ1yhidDBZlyHgeM5jCT5u66N
         0szQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762306109; x=1762910909;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KPPUewGB6So9V+6so9jHVW4+5E6VBrMKCWD6USZE7ko=;
        b=wJTnmiwYI4VYo4ivULyw9az+w5p/sywFb/V/d4Hy6oUSm79A/c7FqtdwQ+T9bsmhZN
         vxlArozmXpIbidG0BlSIET3HNrg27ZU/dRGS2M+L0E4SbtLFz6V6KitD45d59jVtwfJI
         eYzT+faxmH4M13D3bce/nkW6kVIkmLktOVcD5YB8KAidJ1NfJq1eztfzDx68PztcQGaR
         De7/ELMaNSaJLlLXQfhPSBr/+F5J9nVPIiT2b+BMDAQPMxIHqI+Poujy6RpNFAxph+nT
         CPadP9eCadLp9bGuTwoKLNhGoO8ownovjAlsF721V6/Me8FGK0FcfiF+5Dgkv9Zas2vz
         rnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRSmEHZw04VGI1AaNzcMkFQ3ococUn0FnWSzKuumjRgwbjWDlEGUBUzvPHNQyU89iaRdMbqJY6tVsq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx2X0Wy31QoP6eIsUFwXmvaKm48lOrg4aTq2ClbQsWxDkj2NTq
	hqDCDKAKlWqbuwiPjkg28maSlkCbGXEijqZ6KFPR45AWmHkcACaj8+nx/cSw+7kLg2tiG4Am5ik
	89D7I
X-Gm-Gg: ASbGncsDaZhPeabSrTYDhwIxidA6v3otugDg2Fe0odD1aQl3Q3HeryQjIYggVxUdsok
	T0mgwiB0o/bcj7zzShpfy24PpRZ0pqmrlHnifQh2UiFZlSyU6K20kgNzhOlCTJyH52Bg9FKOmz5
	hYOMvsMZjZUOe8fGc/RiR5mlZnEgfcRcTkfMya2hyox/xf77/BekoqoNSNtneXpYFdZnBPHcjxt
	y4HLPCz+psTrtnSvP8EcCZ9xecOp56c5+reZR0OhCV2HgWQJqBc4S1E4Jl/vYttsX86Gh7QGi9g
	ULPgvGYyrmKNKIrii37RkjppN9sYgFzFyAAAfKSYfOFKd1b7OgmTNyOYauhGk493bUjMFm3b5cx
	Fla/poD9weK4mOPHglYQXqk9ev5JkVbaGTJyP+xLj23JSKSyqu8hQGqqsxW1OVKqMFNKYwVwEuA
	==
X-Google-Smtp-Source: AGHT+IFSsqvSbzPcDpvpwxfxx7bbmFddUkB1ctL5ZPjfSWq313S/GL5AMgQivKGFXYYFQL6slLnsFA==
X-Received: by 2002:a05:6a00:6206:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-7acc085a54amr4790544b3a.10.1762306109517;
        Tue, 04 Nov 2025 17:28:29 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd5777b37sm4365070b3a.39.2025.11.04.17.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 17:28:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andreas Kemnade <andreas@kemnade.info>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the omap tree with Linus' tree
In-Reply-To: <20251105115402.1b03f921@canb.auug.org.au>
References: <20251105115402.1b03f921@canb.auug.org.au>
Date: Tue, 04 Nov 2025 17:28:28 -0800
Message-ID: <7ha511i7yb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the omap tree got a conflict in:
>
>   arch/arm/configs/omap2plus_defconfig
>
> between commit:
>
>   c065b6046b34 ("Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS in all of the defconfigs")
>
> from Linus' tree and commit:
>
>   810c5ef6efe9 ("arm: omap2plus_defconfig: enable ext4 directly")
>
> from the omap tree.
>
> I fixed it up (the latter includes the former) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks for catching this.  I'll drop the patch from the omap tree.

Kevin

