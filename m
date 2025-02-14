Return-Path: <linux-next+bounces-5453-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC99EA35ED5
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 14:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43F463A2B57
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 13:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5616264A64;
	Fri, 14 Feb 2025 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="Ytw8eBJa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12BE263F4E
	for <linux-next@vger.kernel.org>; Fri, 14 Feb 2025 13:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739539216; cv=none; b=IfUK9JnMUhI8Ob5KwKfB/uyonFrgq/VqptzLlED1k/sU0LYxvYWvSILivSRLj6RANTmvxHvhi/hzHzLDU/EI7LodJLn+W3KyMbcbwDxExNHw5nAyz8nNkqVjjLuwpbb7BL+nBUkPlyjo7FowXDkjUYtOExG2t6zyBsh5EdknmZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739539216; c=relaxed/simple;
	bh=LJDfth7mwVclpXHFDxPtqz2sjNg3HySlIQhTKo6hMgI=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=GQc7D731T7tcadBwIlYZsHvY4V25BwVSkuxrOYdhDoM+9bo3yqQK1cfnPTsdf94/GxytdE7WKDL7fDRwBj5KRNYwsUevh7D/4dXgNTT/gST5lJoDyDgYUCkd2LnYJrHShC+Rgct7x2PwdBYlz19Jj28xnvbAPicK3caJPd0A+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=Ytw8eBJa; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so2988603a91.2
        for <linux-next@vger.kernel.org>; Fri, 14 Feb 2025 05:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1739539214; x=1740144014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6r8x3zxj8rfgJpz/X4WBbZ2ZvxPjPV23GP7TSjrfJWc=;
        b=Ytw8eBJaENW6FyauHVDqaV63jq9DBVDga4bJfhF8hk0B3vqQt1o9VZMcbV1m3u4Da7
         KMOF/+k7UUBWeWqEu0yMFNjaJgeX9EHmF68TPqjPwmr97Prl+xmvHYRogGHfadoBsGN5
         7KQKqELt3z0X7+nVNfm95YFStiaVi4368qUTF0N4GdlRs/Kua3KDabrYSrFnBes7DGK9
         CZ62Frck3tJsMVuY6jvesP2pvqpQ68I617S60xoLPU16sVPvnzrAv8vrrcQp82RImAOY
         7w8IXCEd7YVJUTc948ngtJ5C59PPUKcJsl7UZ3w1X+aPzexleUFjhIIJo4E9T6nmyO8v
         t4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739539214; x=1740144014;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6r8x3zxj8rfgJpz/X4WBbZ2ZvxPjPV23GP7TSjrfJWc=;
        b=deaydR7sKCRJQdbDzjoxGcW3Wu2InsvW/4wqTBpsPh4iZaVbLGRmUtUkX1mtv5dOTF
         gW6Q1xFZgRNqhr2FoYfAD4Q2+h4Iz4WouuSvpXw0iI2inGI+N/jzBOoq3D84qCCbiwKv
         kMKffWwAcGAg5TQhJEuvLcJUQZQd0941T9oCiQcfG74x4EoPQfE76uPh2DO7RykDEFrg
         si7XmcawuBuoVqXbaYTEv1SOIbtKgwl9hj7GOOoXdpP9mXPPXgGOM/uCOoFpVvqDsYfL
         arPeC1sQZPuIyHYOn54uwYLnqfdorwk3Wuxtpr9n5+8fYl9qqpg+xkA86hc76/3D8wW5
         WkPw==
X-Forwarded-Encrypted: i=1; AJvYcCUmjqi5cykRzvniQBUuWdzoCs7V12UWlDC1lFLxWw7nWisIjO4ppoJ8kY5iQK4ylPwUkaF1QcuFBqal@vger.kernel.org
X-Gm-Message-State: AOJu0YySoorTazFDZU/UpqUjVUoGATbUoCND38+zdfwiqKQTmo9Q/9pD
	yt2421oS9+TgINQQ5GPwxx2YsgLamv9mcdW+88eGiiU5B4DR6Gbx69QkAqXNEyM=
X-Gm-Gg: ASbGncsq60KB3ozJQc5DxtbH3O2SBUuxXAxtAifubjKIVbR2Qw+tUaqy2A0njrDEnGs
	ykzmoTOynF1i6FoUjtlxtw01iYSyoOjkeZS3eVlio2uPzmgGr8ikvyZSiLCo78qiniKj3PWsLoT
	Hxq/N5U8E5tFeaQDKaov6suzwiCUDaCnvy6q3C/tEl2k8IqjfuiMLYyppM1ebnrmELEsBXq5oow
	1+8C/rwv6o2LhWQ5ZGzJQN/EZOPZ2M4Orfz1CGdbwlC0BA0DgyWCHPesImzSwUn254fzEoWhtOK
	JSSPIYlmTnsu
X-Google-Smtp-Source: AGHT+IFAu9PBC3XJNgx4mWEdV9pMcuKKbaayr4w8bIyWW5djqyfxrKy7LSzRf+42OO9NVLq/OxD9yA==
X-Received: by 2002:a17:90a:d88c:b0:2ee:a6f0:f54 with SMTP id 98e67ed59e1d1-2fbf5bf82e9mr17025020a91.13.1739539213982;
        Fri, 14 Feb 2025 05:20:13 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ad726bsm2958481a91.28.2025.02.14.05.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 05:20:13 -0800 (PST)
Date: Fri, 14 Feb 2025 05:20:13 -0800 (PST)
X-Google-Original-Date: Fri, 14 Feb 2025 05:20:11 PST (-0800)
Subject:     Re: linux-next: duplicate patch in the jc_docs tree
In-Reply-To: <20250214161032.1ef4902e@canb.auug.org.au>
CC: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-60a3c06c-7d2b-4fee-9012-6ed036e756ba@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 13 Feb 2025 21:10:32 PST (-0800), Stephen Rothwell wrote:
> Hi all,
>
> The following commit is also in the risc-v-fixes tree as a different
> commit (but the same patch):
>
>   b48e0f696b71 ("Documentation: riscv: Remove KPROBES_ON_FTRACE")
>
> This is commit
>
>   ccc71244f95c ("Documentation: riscv: Remove KPROBES_ON_FTRACE")
>
> in the risc-v-fixes tree.

Sorry about that, I dropped it from the RISC-V tree.

>
> -- 
> Cheers,
> Stephen Rothwell

