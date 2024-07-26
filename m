Return-Path: <linux-next+bounces-3140-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D90C93DADC
	for <lists+linux-next@lfdr.de>; Sat, 27 Jul 2024 00:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45E3B28457D
	for <lists+linux-next@lfdr.de>; Fri, 26 Jul 2024 22:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AFD14E2E2;
	Fri, 26 Jul 2024 22:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="D+U4pBgO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F246814A0AE
	for <linux-next@vger.kernel.org>; Fri, 26 Jul 2024 22:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722034554; cv=none; b=PWenjrhtGu5VSJ5x1U+TFdKlBRxwzw+3emenpt3wUZKoTdjLAJvUOxuVWI3lbc6IoSaahCdfeJdQhPbO45WbvvloYnjUUQcI1padpsCvJFvyPwzrwbTVd8sDDPX/CMoY44+pqpW8qACXUvm6cmSZRwxUpYsi0EIM1hP+0PO+Svg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722034554; c=relaxed/simple;
	bh=q1UpuYWjA0m6cJZL5f2zlwjC8Sgf7Syi0H11qA+WQhI=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=LkgZ0g4XgIsnLqEekrzuuzz8JXPUP7vOseN+tAfZTIXA2ZY7Z+GmoL3QOa6J+6apLxrTzbHAObNej2f9xQMnKFBuSbRYqyvs+sD5SdLGydElvxiWwsYG6Yw4rmiirW5/W2x9G0g4acq830R3yldDOQ1XVNJsvwpwjl19jGEKp+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=D+U4pBgO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d19c525b5so1074795b3a.2
        for <linux-next@vger.kernel.org>; Fri, 26 Jul 2024 15:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1722034552; x=1722639352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+ffwzrPrpDXKhvcgWNKPnQUHaAqmDlPHmBlo4+ylPQ=;
        b=D+U4pBgOXBqqfR+OWjVmCl9lwDur4QjfxE/QL+jMLLH7WPezQGf9SM8cE2XzBmM85+
         0TNogXVCo/8b9eJn6n0zzQ/mkPX50GzIbBjZjVIirtLTHlgXt7vM2cgFWzW6EGqmFUjC
         7bqdHFVZlqb2MW5B7gzqbgIZRUa73VdL+ChQsOCQ3TgwGVeXnTe7fqRkhCYvVWytnUMG
         +5TFmlsX8oNFGXnjOaeQ7bnyka3XilHJjZ7meTqO95SS0v4yj7FS7D2eYjv80qRkQQyw
         AbXaMhqzNmeL/jqWQQwsycaok29vqxYXQEY0hYWr/aMbDn5CTvsKf5Wqqsns/rLlVU0+
         TH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722034552; x=1722639352;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+ffwzrPrpDXKhvcgWNKPnQUHaAqmDlPHmBlo4+ylPQ=;
        b=BJshAOzeBvZT3z5OcULfL3FKv5h/sL65lXRq9t44fWK9TK/qyEEc/pl56KrvQVAz++
         BdwxGVU2VKxlBOYf6B0cdPPpcnpV2Y+hQ5808Y/zky3PHyf0L4i9kFAG8ewliQ8ufVoa
         7p9r+rQDnKI+Zgd2Yk2oG/LRnedVaG4GCw4hj3ZVk2gzqgJcTusFxThw+ubTYyQzpdsO
         /QLe+PANN9lBxCMw/FiJrF6g9C6alW8mXy+fGJofTUCWc7wPcCIj/nO1XEgnMShOWFyS
         jSi0a3ZceJ6DQGeO6Oy0p5JrIlJANg0QhGP52DIXUJBFjM8MWCO7F+gSTpj44I6ZvLp2
         FVJA==
X-Forwarded-Encrypted: i=1; AJvYcCXt/AqdlY4qeMgwPCVPXL46HlrQ4L8nmije1DjFdMz754diz9JV6keUwG+VcbsN9I+aR7WybLUxjacPbIANOL1/OrkEJBXBRb9KyA==
X-Gm-Message-State: AOJu0YwJ5TOka2wIC/cN3o5kjKt38OjdP1ya8gMZYbnSvTyOWryrdTlD
	0DtZ4UqkQJ01fJ0bu2/iesQA4ptrLEkQW2YQcM2UB0dguaQRSdtsmPEkADay2Awt4RIVAmsT2DR
	5
X-Google-Smtp-Source: AGHT+IE1nUFJE09RkD/KVfWEXdc6pIoLYdJNQvd3JzwSJ2Wh7bUrP6PtrhRnc9txFPM/2Vq/32+mUQ==
X-Received: by 2002:a05:6a00:3d14:b0:70d:2a4d:2ec8 with SMTP id d2e1a72fcca58-70ecea0e505mr1246609b3a.11.1722034552109;
        Fri, 26 Jul 2024 15:55:52 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8122e8sm3195857b3a.139.2024.07.26.15.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 15:55:51 -0700 (PDT)
Date: Fri, 26 Jul 2024 15:55:51 -0700 (PDT)
X-Google-Original-Date: Fri, 26 Jul 2024 15:55:49 PDT (-0700)
Subject:     Re: linux-next: duplicate patch in the risc-v tree
In-Reply-To: <20240726075921.4e7719d9@canb.auug.org.au>
CC: Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org,
  linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-2729a5c8-a648-4585-aa3c-dcbc40a5ffae@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 25 Jul 2024 14:59:21 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>
>   96333a020615 ("irqchip/riscv-intc: Remove asmlinkage")

Sorry, I guess I hadn't noticed this was picked up via irqchip.  I 
dropped it.

>
> -- 
> Cheers,
> Stephen Rothwell

