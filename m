Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDED71421A0
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 03:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbgATCpf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jan 2020 21:45:35 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34732 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728949AbgATCpe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Jan 2020 21:45:34 -0500
Received: by mail-pl1-f196.google.com with SMTP id c9so7230723plo.1
        for <linux-next@vger.kernel.org>; Sun, 19 Jan 2020 18:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tSA7tjQ0gZwwIxLsC3H38R1G6GxZRXNeLGZnOEN9y2s=;
        b=Y3qVTjWTPNV5H8+jp1UxyYrh+5RE5/V7FLkYQMxTtVs4Yu1GWSItts1OpZHr4f7SMX
         rds4rGjGDE3RfW/gTysiwdGDwbhGd10uO7eY84wGNujZYt8nztdyp0SWZisov53+/m+Y
         zUyLLltJhior5qAlHoXpoiLJkwSCVYCT/4T8mUt92rXZfdS9QrxjfcIVYlq45pCQXYeA
         BavuhWh3a0ZAhYH3k38x+w7JhSMws0ALDZQDjLTJ62J15MVE282tUNAONxTXy7NerrJ2
         THKdi6+SrO8JO5ynoShOQR3hxhlFIoa+lkmEQiZjBhzK5f9U1iy3bI3CKwja2hRVuF+2
         P6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tSA7tjQ0gZwwIxLsC3H38R1G6GxZRXNeLGZnOEN9y2s=;
        b=CHXvoEYug/16EhtyANYQN9Qx+c3PPOZnLKWmS3WxXyj4bc6VgEcm5xLhKiwa1dU28m
         VlTor1wnp6kSmGdA29UtRS8hlosTVU1+WXbOadRJWMb+DMfd9xwFNBMh+anAPsVBPKKW
         JK5jyvMdz0WtB9fGDnq9+NDnwWmMpJbeII8q8cZcfFijUZ9SIW1Qy/Ckhk6UsXYJBzvy
         owlTbh02UkuHA9J6wyjSS7QNDkYRRcIf8thLwfZ+f8flBSyA9hqK4vJaWu+uTk3UEQlJ
         prmbkHbay+cXDzV2ZQ6gmcDds1khdfycQ9qSH61EJNaGtFeAF2T+HNPk1Ww1F723wNu8
         NDFQ==
X-Gm-Message-State: APjAAAV9KYmDfhxLYv891y9sm9C1MFDA0Wlr/u+99K5FugRQuRPQudUu
        rBsni1Xeq6kE9newqhASPYXVz4qsT8U=
X-Google-Smtp-Source: APXvYqwizD7zKOp7aV1NwnruAEOpn02MxxgF/dP6zCxiIUPM8XwhimnueiHcQcvOLDqJhgNc8Yq9RQ==
X-Received: by 2002:a17:902:74c5:: with SMTP id f5mr12199970plt.229.1579488333971;
        Sun, 19 Jan 2020 18:45:33 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id z22sm37421853pfr.83.2020.01.19.18.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 18:45:33 -0800 (PST)
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@ZenIV.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aleksa Sarai <cyphar@cyphar.com>
References: <20191220123614.5f11d2e3@canb.auug.org.au>
 <f6ff3aa5-e08b-8b25-454a-9aa51b8b5c37@kernel.dk>
 <20200120124051.2fdcfc61@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <e0af609c-aa1b-5a8b-89d4-ea6aff779c67@kernel.dk>
Date:   Sun, 19 Jan 2020 19:45:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200120124051.2fdcfc61@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/19/20 6:40 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Thu, 19 Dec 2019 22:34:59 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 12/19/19 6:36 PM, Stephen Rothwell wrote:
>>>
>>> Today's linux-next merge of the block tree got a conflict in:
>>>
>>>   fs/open.c
>>>
>>> between commit:
>>>
>>>   0a51692d49ec ("open: introduce openat2(2) syscall")
>>>
>>> from the vfs tree and commit:
>>>
>>>   252270311374 ("fs: make build_open_flags() available internally")
>>>
>>> from the block tree.
>>>
>>> I fixed it up (see at end, plus the merge fix patch below) and can
>>> carry the fix as necessary. This is now fixed as far as linux-next is
>>> concerned, but any non trivial conflicts should be mentioned to your
>>> upstream maintainer when your tree is submitted for merging.  You may
>>> also want to consider cooperating with the maintainer of the
>>> conflicting tree to minimise any particularly complex conflicts.  
>>
>> Thanks Stephen, I may just pull in the vfs tree to avoid this conflict.
> 
> I looks like Al has rewritten the branch you merged from his tree and
> caused various conflicts in my merge of the block tree today.  I used
> Al's new versions of the conflicting files.

That's a bummer. I guess I'll have to rebase on top of the new one. Al,
is the new one going to be persistent?

-- 
Jens Axboe

