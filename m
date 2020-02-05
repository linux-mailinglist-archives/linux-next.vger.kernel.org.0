Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBFB153AB7
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2020 23:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgBEWJZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Feb 2020 17:09:25 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39788 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbgBEWJZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Feb 2020 17:09:25 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so1443313plp.6
        for <linux-next@vger.kernel.org>; Wed, 05 Feb 2020 14:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:subject:cc:to:in-reply-to:references:message-id
         :mime-version:content-transfer-encoding;
        bh=BwOR++ZlI6migVRrZllQL8QE2OBgARO29djPlfB1kgE=;
        b=hbQjZrJyGrjjwI9FPYinl8+m5gQisyU9AMnTVhV3q4AIJiN1IRCJflkpWBiOfD0MoK
         3drh9YEc91+HHXaJShaImcpZch6Y0VlXLm2Ea7E7xySAAJvbW1iPHqWQNe6WTHv3hBpE
         60It/p1iY96KFvPF/1gOprmQZkOhqSjorXYOaUR7W5eh2lgeNY5Y5GPdtIITC5neBsIi
         lebr6ME4/wppFvq4zpyrkJN8h53PWmUxNwDepWY6SoWGVfHVy8grlEimmuAnp7QqayE0
         EsLTRWdAl7LivfUGaN/CKkfWG6QNWPrJ6UKccjmjj3CBx1lqatXoPRru9IufCF/fupG1
         Tntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=BwOR++ZlI6migVRrZllQL8QE2OBgARO29djPlfB1kgE=;
        b=EbojvR8wrIVN0jYuT6Zf7VEd7RRM6KZBLMf1sX6BHPFG1WtSgegrL1lZJBexEgJeWF
         Z/7BmEmfqJojxtTphhV5yS2/m5VU9HduHPWFzD/Zj1a3DjazUBmZpEMsBQnWn1mYtDbs
         btSWnkdXg4Mxx50hl1XAUY51jKHUpJ2oIEhCEqa9Lr7kRlvv3U2DvdkWb68yM9vJFfdh
         DP9m7JytdyheDDlz0ZC0u/imzTKjExWy58ybb/tly5oi+Y1TM6pVUdqRY05NN6x4PJMe
         8azH6ofef2D81xCNLjeGOub3/hEgoJsAxiGmi39juifVg+tAaiU1Nu8qL5CN8OZ3tG4f
         wk5Q==
X-Gm-Message-State: APjAAAXP9Vv8CAlQnHiQIOqnRximk5pIi66O7Dk6MqzO4lzWMAiTfwtf
        6E2emNEI+d8trVxdka+PGwPGwUv0x9M=
X-Google-Smtp-Source: APXvYqyleGHIquua3OENEm1+gLOxATE978T3cJZVn62CI27PBhGzKyFGm8DASmLMaMBSeBFrZw3W+Q==
X-Received: by 2002:a17:90a:8547:: with SMTP id a7mr418620pjw.0.1580940564417;
        Wed, 05 Feb 2020 14:09:24 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
        by smtp.gmail.com with ESMTPSA id y16sm742663pgf.41.2020.02.05.14.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 14:09:24 -0800 (PST)
Date:   Wed, 05 Feb 2020 14:09:24 -0800 (PST)
X-Google-Original-Date: Wed, 05 Feb 2020 14:09:22 PST (-0800)
From:   Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject:     Re: linux-next: Signed-off-by missing for commit in the risc-v tree
CC:     Paul Walmsley <paul@pwsan.com>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, guoren@linux.alibaba.com
To:     Stephen Rothwell <sfr@canb.auug.org.au>
In-Reply-To: <20200131071718.248da483@canb.auug.org.au>
References: <20200131071718.248da483@canb.auug.org.au>
Message-ID: <mhng-377e44c9-bdcd-4473-8541-f1c00d249adc@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 30 Jan 2020 12:17:18 PST (-0800), Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>   4d99abce8ce8 ("riscv: Use flush_icache_mm for flush_icache_user_range")
>
> is missing a Signed-off-by from its author.

Thanks.  This one didn't play nice with git-am, so I needed to manually
reconstruct the patch and I forgot to add the tag.  I've fixed it, the original
thread was
<https://lore.kernel.org/linux-riscv/mhng-19381e7d-faca-4e0d-87e6-29d43d7796e0@palmerdabbelt-glaptop1/T/#t>.

>
> -- 
> Cheers,
> Stephen Rothwell
