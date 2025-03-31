Return-Path: <linux-next+bounces-6106-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F25A7668E
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 15:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7DE47A20FB
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 13:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AB221128D;
	Mon, 31 Mar 2025 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="gsl2Knsa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C42121129C
	for <linux-next@vger.kernel.org>; Mon, 31 Mar 2025 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743426444; cv=none; b=Noap2BEzeqZS/+GLXAYmN1XLc64c/LQhTm1MZzIqsUnMmZkN1QSiru9lo8bBkgsg+OQPbWMnuKSBW0WmROjAEZ8HqSeEwZqjk2hDEt02iKd5rLW0xhg/zY48cAGi8g/wJUMtakF/gAq/CnfdV5cnO6Ys/eMwewsLNoFQl8wOBzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743426444; c=relaxed/simple;
	bh=16YwZIoXgnM9i1KCudAoJ/d9NcgG2KIssSVas1YK37s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWvVt5EDTfZmBI3zo5rnzFIsXtAIAxiUT5NX88aL+MolCIzX3aK+rnGkELeLZPpA6wTotTnt/B6LNcTFTGbacguyQNuGImMapK+q4Bq8Jq5PqELOFt/U/4DUFovLX9j9/htr3fVkxGCH9T9wIBLu4JNsVRiSOqgQNmDP4dRrg2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=gsl2Knsa; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d5d69c535aso9702855ab.0
        for <linux-next@vger.kernel.org>; Mon, 31 Mar 2025 06:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743426441; x=1744031241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ed/Ddyzsa1QN6yzj0LbFuD8MNEjFi7fRrdU4dK99FE=;
        b=gsl2Knsa2Uwk0CxzHOT5kvv1hUlPdbHPCCTlxgJcfo9I/G0tEZbGwl+OHAtzuQtPWx
         RAGy0QFGFc1CGdEx+IcgaH0T2fMrGU/zZ3FucCgyOBEOfZHcIIcUlVVt84eC3Vw44juC
         1KwPZ6K1tTU0x5YigBSByp6IX5GEWvjGokDmzHKZ8nGZ977TksCtRlR/kPelF10N9bZr
         Ey2amgFvqIENnGA8UgbdhIlJetiJQ47XPShzmSBofkkTQLx6YmqrMxAZjP4mRRODK5zj
         yiyrzjpQ7zezTJNgyYPn+tyuJP5+jCk+6GF1gHVmlNPl46tGAkRS9nR2DNocmZJoQ9TS
         ZXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743426441; x=1744031241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ed/Ddyzsa1QN6yzj0LbFuD8MNEjFi7fRrdU4dK99FE=;
        b=nrUryd+pACKHNabc7caOYu+0mZ/Xq/NQfU+3XHauuTPeheg+41eng0Tqs/FZifIU64
         NuppMl9PK+fKJaOCnmdySuRDWIKlvTStPFKpYHOks6GagD5OrDAlDqf+N2bjD5hDEQZg
         lnPZ6S1Vhj0P/gFg7FWGZrapVW+CZDGrVddb+admt0kYbwA2Ak1UF1ndxO+FeDpy/ckU
         YDbMWcbWjVKj+f+4g/ySamPDais/BSXiyzCbIM2+mdqrmIsC1f4+y35DFDoTRBFVRIax
         5vIuqWrxhmzXyeJBmCVprFaZZGeBwUntGYmrVOt5I+7qGnJHQ3xN/ZOyu7Vu4xSMpDUq
         SenA==
X-Forwarded-Encrypted: i=1; AJvYcCUidg3tkLerP+aRWHjA3tAnw5FUi3uyAAdbIiORk4xrAchnbhJ/NX7wqftWBcuS4eBkNSqRXQgWBrpD@vger.kernel.org
X-Gm-Message-State: AOJu0YzRzKD1IdPQnGH1Fpxmys4PW4OLhZ9y34sFMkPRaRKyGoWXJsyY
	7ndUxAWC9NBXch8AzTF4lyTbFc2aAaYUx9oYhUbgdun1o6+3IGXNH4BiV7X02gI=
X-Gm-Gg: ASbGncuRAgYENxDWQ3WRruHaw37zbQXlYIdfdl0KwfGCUAZtvexeZyDnLBYp5JiFUqj
	4+PVkFyMezIc6Z6PR67DVCnxgmqxEQGsYWF/SLOyvhjn4+necrvFcm6iRPvQ8zK0SnECn/7sdp9
	x5k6dvCLVKnlK5D3v3auNN3TTmuVN6WuPgbXZ6T3sqYRhvv+5biiX6C4ns9n8EXA8YoECjXfDpG
	opQEuULk73a5E8U1iEeJ9yit++L2RnPiEFd8get9U9VeNYe3mwICIVpJIJsXdAXbVDOKi5zQrd5
	+DlVwgnbrA/qCXbh21O8Zs5U8KCi/efwGX+G6TVc+g==
X-Google-Smtp-Source: AGHT+IG32Cg6zI9tmakUIJ1DbRmEZpmwRLQi8qjY4xoSKRbxylqUWbU9vadDFdtujdQ/ao3ofcsZDA==
X-Received: by 2002:a92:ca09:0:b0:3d3:f19c:77c7 with SMTP id e9e14a558f8ab-3d5e09c8d9fmr73771055ab.16.1743426441218;
        Mon, 31 Mar 2025 06:07:21 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f46471b40fsm1863674173.26.2025.03.31.06.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 06:07:20 -0700 (PDT)
Message-ID: <aa8b9ee9-1787-421c-9914-d3d7c77bd1a2@kernel.dk>
Date: Mon, 31 Mar 2025 07:07:19 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ming Lei <ming.lei@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250331163734.7dc27905@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250331163734.7dc27905@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/25 11:37 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/block/ublk.rst:353: WARNING: Footnote [#] is not referenced. [ref.footnote]
> 
> Introduced by commit
> 
>   17970209167d ("ublk: document zero copy feature")

Thanks, I killed the footnote.

-- 
Jens Axboe


