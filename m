Return-Path: <linux-next+bounces-7073-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826CACF428
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 18:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1CBF18895A6
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 16:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CA02609E5;
	Thu,  5 Jun 2025 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="hJSZ3sU1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9054722B5B1
	for <linux-next@vger.kernel.org>; Thu,  5 Jun 2025 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749140631; cv=none; b=A3YkCu3GoyFPYEaVAy7P7aPCoUg6938eJWNqm3ut0xOvmAq9TLkMFwQ3SuNJYGiRLeOP+ErDAfu3DeT51YBNY35U9C8KTJ48juZFqEYgFiYiTqrXfEJmwyREOp3TXUy6GJK5gvLgu0n3M8mBtGKiEps8yJitBk+8lHJuDLrCbVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749140631; c=relaxed/simple;
	bh=PjYlWDp3BNrBuSPWQfwonAQiBjIaNMna15G9r40nETU=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=DD/EGNw7k82X0JrFvsHbltt8Dev8S6VH3Q7k0GVkkFKD5K3rZCItKtgjc1HdTbX4tdbiOfxqbsjS7GFAnu72Qccc6HqYpedmGxgybMUVS0B6uxkadyYHZfwJj+nVnyxjFMWy19xItXatl4roYfwZL34muYmcBtoYpqSRQ4ab1DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=hJSZ3sU1; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2e9344a1398so733271fac.1
        for <linux-next@vger.kernel.org>; Thu, 05 Jun 2025 09:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749140628; x=1749745428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhmkzSl4miVAEgBkjZzGaQa8Svu0eHPKNh52KfZfwCE=;
        b=hJSZ3sU1uineY0HnI9SwIJKCeu+hzO3l1HovTAnlTVSTGCZdRWqCT8c5ltXRNHkDsX
         fZ8VomimHr+ACzzSHAgM7XViApAhOtcuN5z1qaIl8/aOd2U37fr6pDF0WDv0PSpzJnFR
         93ONSgGO0JVJJxePmt7TIuSeV5F6DvOpXBA0uyoI4P4RecMkL0Slfz0IxDpYABb50gRs
         71hZdPU4PmhdtB9Bi1yiuuyCto3hpAlvFMpdQJ1FwQptfs8aW87SLjXcGMo5BgvpYrVP
         BNHN7/u4yMg3dw8DVsHcaUM75WoD3XYmGvSWDGGsabg2NT3jByWtG4wV2B8r/W0fw/Dq
         N5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749140628; x=1749745428;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhmkzSl4miVAEgBkjZzGaQa8Svu0eHPKNh52KfZfwCE=;
        b=i4WPahvSAagh6Yrp2XBG6MdtNFgtt9afECq3csnBQ+QYXzCHncuzpjeGT/XKz2rchs
         nOF0F4Em/r7QuvqlLqdw9DCsdbregHlhnJCMnBxTqA6guVa1O4MEd87gtPhWoierfg9K
         nNWZAtzdvqwALmuH+z8ZQ3OZUXwlB6pPU3vQWgKzmwDJiJeE5I6FziDx3dURF4R+aazH
         he0LXOMFINpHElv14aQdeGWLMoDR0MDt3he2TIYZzO3cKtteFcCuWvzmPsjOfjNeyWk1
         66UkHjbBVckZkAJujmC1ip0dczkMkUVrp1yHA4PsO8cyhEKJ10qZ4f++Vtp9AFYnZ95d
         asHg==
X-Forwarded-Encrypted: i=1; AJvYcCUpfJxekIxA7rEZYox1us0P/X64gIGytawx2TUY7ZuybDSoGfS18+IV9AunIPrjsyZa1SS3ixGfM4pg@vger.kernel.org
X-Gm-Message-State: AOJu0YzIIaEJWaKOZcM6e3zJyxhEcDcSmqBk8RDsTCT9+lndl4yMW1Jq
	6YLG7+1XFNKUa0Avxgh3cGy2Dfv8AXoALRPOdzxG4NiZYeLb0mXC+VE0g6U1AnY0dwyUDOmjEy+
	v7FRz
X-Gm-Gg: ASbGncuUc6TL3AMQX+5hWmrfuD8tzLNfe5WMOL7M0Wtm6jzfJRMmBwUtmpe+o+ce+RE
	oEdtLjh51B9Prx/Ox1yV2UVl/aZrMRWekxeWfezWURyR+a3OkyhnYkJ+YUTcZZGV0gZVq2mMwE3
	tDkYfxjQ+DPPUTdH9qfECSB/bEVQlsH9lwsZp8lA6aRAjW1W4om4xNN1HrnCX0EPNkK58jduvVu
	LbWKMuPiuujYPoZxY1vCb9ClmjHNIfzsY1zfYQvmp/wIePk4pZrRSrfd5IHNJojMaeDaQ2SNt4f
	iMtHRtjKewlYM5GbSWyJswoJSO5TmMuEoKG0k68WORZJ5YNcmg==
X-Google-Smtp-Source: AGHT+IEaIBy6yNKTCUA69UCGRX2VPwFS66IMWYvdLzscieBWr+NLD4pWHlMFRxq0s85XKrHw06zihw==
X-Received: by 2002:a17:902:ce82:b0:224:24d3:6103 with SMTP id d9443c01a7336-235e12535e8mr123606485ad.35.1749140617531;
        Thu, 05 Jun 2025 09:23:37 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:2592])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-235e425ad08sm27445665ad.129.2025.06.05.09.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:23:37 -0700 (PDT)
Date: Thu, 05 Jun 2025 09:23:37 -0700 (PDT)
X-Google-Original-Date: Thu, 05 Jun 2025 09:23:35 PDT (-0700)
Subject:     Re: linux-next: Fixes tag needs some work in the risc-v tree
In-Reply-To: <20250605163513.7cfb7f2b@canb.auug.org.au>
CC: Paul Walmsley <paul@pwsan.com>, cyrilbur@tenstorrent.com, alexghiti@rivosinc.com,
  linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-3E0595D4-92E8-4E7C-B02A-C33F7289E4A6@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 04 Jun 2025 23:35:13 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>   4e27ce58e7fa ("riscv: uaccess: Only restore the CSR_STATUS SUM bit")
>
> Fixes tag
>
>   Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: b0feecf5b812 ("riscv: save the SR_SUM status over switches")
> Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
> or
> Fixes: 8f9b274ad153 ("riscv: save the SR_SUM status over switches")
>
> (yes, they are all the same patch ... and all ancestors of 4e27ce58e7fa)

Ya, thanks.  Something's gone way off the rails here, let me try to 
figure it out...

> -- 
> Cheers,
> Stephen Rothwell

