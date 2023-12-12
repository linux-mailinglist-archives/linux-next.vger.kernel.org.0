Return-Path: <linux-next+bounces-362-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4180EF87
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 16:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 353CB1F2150F
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 15:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B053745EB;
	Tue, 12 Dec 2023 15:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="1VxMqQ0q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D74DB
	for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 07:01:40 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7b74bc536dbso23720139f.0
        for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 07:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1702393299; x=1702998099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ang1nCl8Jm3Jnw0Trx7aK3jW0jOvkSmS0o2JfMszURQ=;
        b=1VxMqQ0q4oKfsDaWkCDW/gHHGvaVbuLmRGyxPTy+GK8qECb39MOJL72AhfPDowL63r
         hf3xZqRDyI63uuoA/GQUjHjfD8Y3UfHG6/MMWow52LiGpIIFtd6k6541uUzBDA0iCFzC
         PyJNxHr61TfeRhr049EiG2e/5GARumbCkhjRiOvgylt36wy7NwRUfr56Eqlv4Qce11Wm
         Y6ojGJgHSFKmzP33xrc3rbMklTpd2i+yBMB2jmQLwjoLyvauyGUhO8RjhaamaIaSNHxK
         4nu9KiklWnTSCg5k/bObRmRNaAfrTaJ6IVTUaUukQRvUkAzAPNyB/0r6x1137lYDWWSq
         kUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702393299; x=1702998099;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ang1nCl8Jm3Jnw0Trx7aK3jW0jOvkSmS0o2JfMszURQ=;
        b=clktaz04WeJmxhAuruUZk8wOw6o60asGBWbfjNTPP2Iq6vv7FD65BeKIlVpZSLL/lD
         Ydfl9PC/nIkB58ZzfMqTH//Co73y9MMIuEoc9okWVnUCocvI9WtSj6VSGDJcNPKsBMEW
         osxY2+EgrQA9dqIBDXYYbyS6eIMSQyvpdTOZ8fi+6jZI48YF7oDH9Mlh5p7WkLZm/EdG
         t6x+/m1k1WHgcAKQFRWCWQwx0YgFaiqcM4V95K5Ut8+ztYmFGXSkoMW8ac5WGtXy9tfw
         ZOLnhiBNfK2+Q54kcfc+wztZwmx4p9sT3sdEMYrBTL87gx9u/PiMfhLGZlm9UYGbkWrn
         iQlg==
X-Gm-Message-State: AOJu0YzAnPzclwjSsZbvlh8XjC0VZkTXljuAPz7eyEOyAtA8E5oJHPSL
	UQmskApQzl0wFQGOSQPmgS6KBg==
X-Google-Smtp-Source: AGHT+IH7qpx1lIvuIeLGtBhMoJA4VKjS5ZY5BsCzE5SvxLi+0WSdlLyvXuj64P1RhEVFHgnEwds6FQ==
X-Received: by 2002:a92:cd82:0:b0:35d:7a37:5236 with SMTP id r2-20020a92cd82000000b0035d7a375236mr11505131ilb.2.1702393299512;
        Tue, 12 Dec 2023 07:01:39 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id h17-20020a056e021d9100b0035d3be59977sm2942369ila.85.2023.12.12.07.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 07:01:39 -0800 (PST)
Message-ID: <b203a609-1f5e-4d1f-861b-c252ea164c99@kernel.dk>
Date: Tue, 12 Dec 2023 08:01:38 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the block tree
Content-Language: en-US
To: Christian Brauner <brauner@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231212130213.631140dd@canb.auug.org.au>
 <20231212-innung-zuber-2f10bcffac51@brauner>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20231212-innung-zuber-2f10bcffac51@brauner>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/23 6:38 AM, Christian Brauner wrote:
> On Tue, Dec 12, 2023 at 01:02:13PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> The following commits are also in the vfs-brauner tree as different
>> commits (but the same patches):
> 
> Thanks, Stephen. I gave Jens a stable vfs.file branch that he can pull
> into his so this shouldn't become an issue again.

Should be clean now, rebased with the stable branch pulled in first.

-- 
Jens Axboe



