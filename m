Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F8587070
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 06:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbfHIENX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Aug 2019 00:13:23 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33068 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfHIENX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Aug 2019 00:13:23 -0400
Received: by mail-pg1-f196.google.com with SMTP id n190so4368180pgn.0
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2019 21:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LGK8xAZED47AcxPYpmeVFwakorLRQKz2XkSu4cZUBv8=;
        b=j3bpd+7D3wUCvAEYoV3Y/8lm4FWgAoY76rcVkZtEaoHa+ndQL4NDjQvfepNmY+3WNY
         jJsz5z9vZ80e8wQYtXIup39sYwDWnz9gIJBVWEfQkGlQCpE4luK0aADIBLXy53BdwE7K
         5u6g6AUXj60g7GLdg1TAhk0Hr92wpwr125DTbII51fypY6wfV1gss26UCj5yOoGEhV0s
         +gIAlAss9lj7T01L4j/0EKlpU6xGnCyvcY9BLXuBhwCBnQINlc5slzjpEfNR8F5ktw0q
         zVMHwkTj/rYUJZv3kx597RHnoHfT6F8mNUHymgi3RQzspZko2TtzfRFmyVt8Mhh+sA6E
         /d+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LGK8xAZED47AcxPYpmeVFwakorLRQKz2XkSu4cZUBv8=;
        b=a/59QyTU4DlbzXovwyRg8yxyYnsY7HtK5NU3Tgzt68GGk4pch71m+kHSGtNQneTrgO
         vvo07fP0EEuNjrvZ4Ot7bZIgEMaZIlnjDT6OTOKBY4jHzqtqUHnc4dXsrY23+xyaUjGk
         KYBdB8O4VzU+gLuljG1pI9jHHSWRaFb7SlUQNt/eVOmDetmoU+PPPm9umInVR0rY8n9x
         JvPwcAbdDKEwPWLjaogV0MjneDrpO3g29jYEVPP6TZm13zrojmDI+K/1PWuQ3e2kJgUb
         fJ5g6rh3gW/fIIp34udsyUNljEMmLopE69MVpWEbU+v8mTcSxVbKyDQOLy0MLkW6Ro3T
         8gHw==
X-Gm-Message-State: APjAAAUr/OxUcQ050/xQ1M7LQ34m0ZK8Putxp4nKcP6MAB8YRZzhei0v
        TsPN0QdP8EUT56bqU3wrWdUB5w==
X-Google-Smtp-Source: APXvYqzh3q7R1YyrpddBNx1XEjBFU2sNbRDmfbQ+qlJzlueqrAl789IfvTUbC97ryEzU8sr1wUlFuw==
X-Received: by 2002:a17:90a:2385:: with SMTP id g5mr7670145pje.12.1565324002505;
        Thu, 08 Aug 2019 21:13:22 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:83a1:b4ad:b9cd:bed1:964b? ([2605:e000:100e:83a1:b4ad:b9cd:bed1:964b])
        by smtp.gmail.com with ESMTPSA id q19sm102078242pfc.62.2019.08.08.21.13.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 21:13:21 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
References: <20190809140035.5b59c31e@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <fd42e4e3-a17d-599f-bc95-43f603390cbc@kernel.dk>
Date:   Thu, 8 Aug 2019 21:13:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809140035.5b59c31e@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/8/19 9:00 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/lightnvm/pblk-read.c: In function 'pblk_submit_read_gc':
> drivers/lightnvm/pblk-read.c:421:18: warning: unused variable 'geo' [-Wunused-variable]
>    struct nvm_geo *geo = &dev->geo;
>                    ^~~
> 
> Introduced by commit
> 
>    ba6f7da99aaf ("lightnvm: remove set but not used variables 'data_len' and 'rq_len'")
> 
> Removing the above line will also remove the last use of the variable
> "dev" ...

Thanks, will fix it up.

-- 
Jens Axboe

