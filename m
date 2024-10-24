Return-Path: <linux-next+bounces-4423-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F79AF48F
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 23:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AB9BB22ABF
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 21:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEBC19E975;
	Thu, 24 Oct 2024 21:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="E04oyj/n"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8191AF0B3
	for <linux-next@vger.kernel.org>; Thu, 24 Oct 2024 21:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729804462; cv=none; b=rdJUpD6gM/VmCmfdJkl2Lk/og9taZBcBnvx1gkFoXLYE45XPzqt1laqOjcs497FrrmGNBe15r5AAb0jvK1/lCpdR/rNB87gPSaTHW0b/43aqMw6Yqecaap1d+YeDDDKdb7DYcYGoS9kAi5Y4qH+gvlgVh4KoedYY4ZuGuBTAiEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729804462; c=relaxed/simple;
	bh=rCWo4AEZm1UWnEuWWDbCGjSYu2CiVU93lvL0UlLuZq0=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=CRNjyFCFoDh54YfRXfi5sCm0qIKQuP3A0plaQ7C9Br9ipI6qhSIvxL2Rf6wMbWa1ijLhqmU/c96BanYCb3xiD85fz7BRUnavLfzLkjEw1Uoz1eq3j945MxSdd5yUj20rK3RVe9Zu4B97qgMvFE4mTv5NgQKOwd7MBSsQ5CdrdMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=E04oyj/n; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2e8c8915eso1017592a91.3
        for <linux-next@vger.kernel.org>; Thu, 24 Oct 2024 14:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1729804458; x=1730409258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiJbyHkpa/rD5fDWUJqjFih69lFbISgDjEDgatp+bhk=;
        b=E04oyj/nUwxFDG6JtAOoIrNXAjhc+b9fSl5GCWG1pXXFWBo3AeiVIRM49jfezBlgW5
         C1FpgbVw64Ym53bxTYDbr+L8n+mvQq0jFeYlzrkxJqDwSfQSgLOq0zLmmCm0E1HbtYmK
         g00G9fhjbWDlgsgVczAzlv5GfKFRP86bepo+/PIGYgqu4N7gXY/D3p3cW1C22x7JuJLE
         8vZ3cvPhLz5bOIa71faUg0k0eTcAD1qA2cYWZanA1nNEB6X61/6qEguzYzfkKs6kSlkm
         vFBvd6UYA9MuCGRberFLy1suYS86G3VKcwvLACi82ZDPQ9vVCq66e5a4hZJSZ14SC5YG
         arow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729804458; x=1730409258;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiJbyHkpa/rD5fDWUJqjFih69lFbISgDjEDgatp+bhk=;
        b=lH7aqBTVAUgeWKQCAjgAZ4pQwkniZws1O7vGo820/QSBHlTbWzJAX+b1J6XWwBJ3uB
         7xcz5lyEhtty5jTUFyH2znuV2pQ0jpw37f2wiCpisQOULw6XAbvn4uPa+Pjs+Qk/UKNa
         MSPNh/MJmoBvetjfqFQp4LMrPnH1CYebVENQN0jKVC67mzQennmfb2SNY60iy2pZh63G
         bQsp8QdiebUreS+l3zy4DxijMMPRBn08gerJOC+VeAi0iZrOJrDLcOj7YlR+04lCnID8
         yMs4nZVOZwaTNxeyqD23adi4z6TAox8jkYieji1WUPNuv/gndXhsZ3b6P9NnRN9sfi7y
         gBDg==
X-Forwarded-Encrypted: i=1; AJvYcCX9SEmiA5BklTflvvpZ0SG0dM+gFazLmMmxdvP/IHj1PbJOolV3WUZruWznTr8Nf/OtDk0DsPwTpzD/@vger.kernel.org
X-Gm-Message-State: AOJu0YzGoHTGGncB8NrWL+hQjEVE+vfvjPWFgWywqkYGdQWV6FCZjg3H
	0BeR9+Tus/CHfSnvTy7c6HS3lB9zRALW3OlMJxKAEiDHPZliKgb9cB2gbj8gVso=
X-Google-Smtp-Source: AGHT+IExxVdLxb0EnGXeM9uQWuYp1Z31moAXdVKRy0/68mQvvpnpPMGCMSpxRAeKSBwWk9PYSDKZkw==
X-Received: by 2002:a17:90b:3b50:b0:2e2:a96c:f009 with SMTP id 98e67ed59e1d1-2e76b5dde45mr7947043a91.9.1729804458375;
        Thu, 24 Oct 2024 14:14:18 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e5a321dsm1972316a91.53.2024.10.24.14.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 14:14:17 -0700 (PDT)
Date: Thu, 24 Oct 2024 14:14:17 -0700 (PDT)
X-Google-Original-Date: Thu, 24 Oct 2024 14:14:15 PDT (-0700)
Subject:     Re: linux-next: Signed-off-by missing for commit in the risc-v tree
In-Reply-To: <20241025080355.34c62c4a@canb.auug.org.au>
CC: Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org,
  linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-3386c07e-d82c-485e-b12e-4a44f1c3b893@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 24 Oct 2024 14:03:55 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Commits
>
>   814779461d84 ("KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list test")
>   e27f468bcf14 ("RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests")
>   d250050aae4f ("riscv: hwprobe: Export the Supm ISA extension")
>   5e9f1ee1c523 ("riscv: selftests: Add a pointer masking test")
>   cebce87fb04e ("riscv: Allow ptrace control of the tagged address ABI")
>   c4d16116bd11 ("riscv: Add support for the tagged address ABI")
>   871aba681a0d ("riscv: Add support for userspace pointer masking")
>   1edd6226877b ("riscv: Add CSR definitions for pointer masking")
>   12749546293e ("riscv: Add ISA extension parsing for pointer masking")
>   8946ad26c0e2 ("dt-bindings: riscv: Add pointer masking ISA extensions")
>
> are missing a Signed-off-by from their committers.

Sorry about that, looks like I missed the `-lts` arguments to b4.  
Should be fixed.

