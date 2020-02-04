Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC3701513A7
	for <lists+linux-next@lfdr.de>; Tue,  4 Feb 2020 01:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgBDA2i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Feb 2020 19:28:38 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33923 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgBDA2i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Feb 2020 19:28:38 -0500
Received: by mail-pg1-f196.google.com with SMTP id j4so8751826pgi.1
        for <linux-next@vger.kernel.org>; Mon, 03 Feb 2020 16:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vAhBNULLMh9XOTvTdD4G3os1qV1uXBckyQ+ldlyDpfU=;
        b=cPhAokTZ9kQlxDMTNKVdWb25SdZQI8UBNjRVl3ZSbzLxuAeFM6nmq3+LvH5C//TF72
         KnmhtKKTDOHe+qmvVNbgnDAq2Img5xAMjhjYPLWv+sLiUToMmBjdRXFhceXTZHrF2ZbY
         QAgYwXicceFkzvpgstFkXqu24LkxVf4tauXIa/0VhQSciw8bdJEQn5AkAx2RfGETBATL
         sTUJK4WpvdJJ+lHg8NEvi1TaCek47dl7BprkR5UbBzvJ0SEB9KQamt7iu86LmxJXmwnt
         /6C7kujevhxm1/7+UJB4473pqpmOeMG8UwOChUsbyZ0K12JZ/+PasYw2ROZpLYfmIVgv
         Wfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vAhBNULLMh9XOTvTdD4G3os1qV1uXBckyQ+ldlyDpfU=;
        b=pTWPW/SYD1C/hBayGOeqqRAZ4O9WsbpZhvJGnvv3BgJrprAse+juKLNTWTdLwCb69s
         0eOdJsIKk8SS/aOeIz9sqXbUs8VSQpBb/eKa7QZs+UfkR/59oaHV8FUVsl/PT2hTfRuX
         Agj939XQe1nPRPZU+CsjIq/LjtNqNhHTpIPASCwOEEPOVpA7FcJUCjH9vAzBwpsFCoMB
         bLcbnhgpbalO13JQuyp2EeQayyUSNnCQi5joKKg/0o9mhHA1vg1UzaWKY5VL2WTP/6xJ
         YChacj/gIMV1PQhI/3Sjf+vruKVyEE4C0uZlozMfOiaDTprIBNwT/viTpTxEg/CIOAzn
         IKOg==
X-Gm-Message-State: APjAAAVXPU7lYG1NCmyUm9UzZy3ZwyLnZuCG1pWpV/ZKlmH+EErq5VDv
        ztDXtXjVTaT74pgCiAU4aiFBXih0iM8=
X-Google-Smtp-Source: APXvYqwUc9cZI7DMbGryZAH6VeR/EOia6vpZadPgVDPS+m5PjCNf3yY9tmflych0xth95EjpIgFBDg==
X-Received: by 2002:aa7:864b:: with SMTP id a11mr27630304pfo.175.1580776117631;
        Mon, 03 Feb 2020 16:28:37 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id g13sm17438595pfo.169.2020.02.03.16.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 16:28:37 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200204112555.0f1b1490@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <eaad4710-872e-a0fd-33df-747d16c8c293@kernel.dk>
Date:   Mon, 3 Feb 2020 17:28:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204112555.0f1b1490@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/3/20 5:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:

[snip]

Thanks, apparently we needed two includes... I've folded in your
fix.

-- 
Jens Axboe

