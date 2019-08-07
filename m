Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C41684AA2
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 13:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbfHGL3Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 07:29:24 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33334 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbfHGL3Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 07:29:24 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so63867017lfc.0;
        Wed, 07 Aug 2019 04:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vvW4S5rThYF8Ijn1oNiSYl98poFtdvdqejAeFrWkm2E=;
        b=RkjzeSnQjWpdZy4IfRBWAPLbLm6PArWCXI6RmDEdpjiqTDNI1FEO6iLOpGf1l31/qY
         r/snNT7mvH7imvF6180TwiaQRpDKtjVsD5ihmPx16iWi+VdEtHUvIg0RIzjaLvg3dawT
         dHMdGefAJzI6FixgSg7uq5YDwDaCGBRtyICC+Qd0KXhqaPDNYIzo7qHqUvopNwyRkC7Z
         nyyvUfD2nKzpMfckpkaw6YmukLzSSXbJ1zJRR2G5Dcze9GDtraWcFbwJ1aY5565oqvJc
         au22+wiN/SO4R9BoImtEcjJRDhTikU0Bs/rAbXHbIhrxoF7xRvhEftHafuD6eAu/Zyg5
         KxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vvW4S5rThYF8Ijn1oNiSYl98poFtdvdqejAeFrWkm2E=;
        b=HMopAT6rFu4ad20E3OtVz+Zx64QaYReRdvOtI3xLZd5X5Ht+UBkYjz/u49qkTf/Oq+
         DPtaGjUcLl0NWbhN3VapjqoVaM6w7oNi4krffdq8sRmfUmlxTK68ldk53LRs9CK6qB+N
         kUGYELa3hNuWKMEehkR5ixGLchVPQE7cFrmIM1Q02oq9wd+2Y8TX4b0OFvjn3xgaInrX
         m4KueKPMZc3OEiykbLiY6cDsDXjeoLHcpJjSnXCRRkPngRX5132fv2Xe/9Yce52DabIl
         t248wyeAx+jixcduJP6nK76z4yw+mzPLJAuXIvcEYi63UMroQFU+eEK02xJYk7D87W9/
         Nm6g==
X-Gm-Message-State: APjAAAX4LRwYgvMXbZCcG+hBlN+kCsN/vvkltlfBDDEdczUFdKU4aE5Q
        rmAZ/92ksnoOvaT/Vn0+jOk=
X-Google-Smtp-Source: APXvYqxevCqCcs7/pTo6wUbVEiJmwEvY1ydQk7dCW9iIexwfDJ7krXJqKim+MEyxnrazPhpHBvYJ1A==
X-Received: by 2002:ac2:52ac:: with SMTP id r12mr5373215lfm.54.1565177361769;
        Wed, 07 Aug 2019 04:29:21 -0700 (PDT)
Received: from rikard (h-158-174-186-115.NA.cust.bahnhof.se. [158.174.186.115])
        by smtp.gmail.com with ESMTPSA id g12sm2125806lfc.96.2019.08.07.04.29.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 04:29:20 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
X-Google-Original-From: Rikard Falkeborn <rikard.falkeborn>
Date:   Wed, 7 Aug 2019 13:29:17 +0200
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20190807112917.GA4624@rikard>
References: <20190807180041.07f06dc0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807180041.07f06dc0@canb.auug.org.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen, Andrew

On Wed, Aug 07, 2019 at 06:00:41PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/bits.h:22,
>                  from arch/x86/include/asm/msr-index.h:5,
>                  from arch/x86/boot/cpucheck.c:28:
> include/linux/build_bug.h:49: warning: "BUILD_BUG_ON" redefined
>  #define BUILD_BUG_ON(condition) \
>  
> In file included from arch/x86/boot/cpucheck.c:22:
> arch/x86/boot/boot.h:31: note: this is the location of the previous definition
>  #define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))
> 
> Caused by commit
> 
>   d72f2a993607 ("linux/bits.h: add compile time sanity check of GENMASK inputs")
> 
> -- 
> Cheers,
> Stephen Rothwell

Please drop this patch, it has additional issues that needs to be fixed
in another revision.

Rikard
