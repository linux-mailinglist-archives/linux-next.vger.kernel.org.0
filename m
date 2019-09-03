Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 145E5A6691
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 12:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbfICKcx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 06:32:53 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32957 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbfICKcx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2019 06:32:53 -0400
Received: by mail-wr1-f66.google.com with SMTP id u16so16908167wrr.0
        for <linux-next@vger.kernel.org>; Tue, 03 Sep 2019 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ha7HjVApVIBrr3dxuJowVFNfwudTzAl93+qSCHVKi3o=;
        b=ytLJ19VtqKQkrSduGoMwp10Fu27RtDH5pjVgQZOxbuE8vHTf+8T0E/MZ34oCV5Il45
         ZP0Il/BGpffqJnrS002ccwaD3fxM3rfTt+QoGSmDciLQGp1aptcRUQMulGFXEzxMlBLF
         ZRAtgAmBoARYA82XGzGJTFLHI/8jTrXRwTh7ddLGkHdjLz760zmweZotaqjH+IWwSCuN
         Ht2tDqZmRsR2/RkAYpwqLU6nJAte1hJXXF72AYVu7e9/s0wy/cI00tIzpzo8y06z0zj3
         WSWPvfnlZupKclk0Sx72sXdpJNzdGl+7SG2qfibSKGp/pG9nQbOmBGyVWo+nseFWpVn2
         rdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ha7HjVApVIBrr3dxuJowVFNfwudTzAl93+qSCHVKi3o=;
        b=b/HzjrQ87j5lSY1X0J7oyXpjZdkGqc9AnetKv6IlOyixUHeA4719IGpKqxrrqiZEjS
         pldzaNV12j8Fw+m5/FZoe+mGClrBjC9BHiOVMARv1Bi6KaO8Lqf/myc+ZVXDXLJBY8BU
         4qbY+WrpC289JnKrmfNg/cGTyY4Z+pLwiNzaWoVgGVYUZDChjFoDkGFk3mEsZkRxWm9j
         RbNJpBDjl7N0VwhDNI4ydc51Rp14XJcWxTsI9akn1HblnkHgtvsMZ2e+OaC4mf68MpJo
         HrpTOSsOlETpd7EIIW0PxeIRGr6Pod4j5cU2sPjTlj8jRjKz+e7/0nnebXpa0/n2Q3Ea
         7UKw==
X-Gm-Message-State: APjAAAUlJ4J4BQXvBiz4xTXRVkH7uwk535/MLjspm85adMMhWUWwC9/c
        07wbFGySsf6ISlPnPteMH66lrw==
X-Google-Smtp-Source: APXvYqxF9Oxg1RATCNL9Oem2wg9vobFnyZUl0s1lWrf+uPQaBXKhD9qrGpGTgHjp1EpsQ3PWRbUa3g==
X-Received: by 2002:adf:f486:: with SMTP id l6mr26819612wro.232.1567506770616;
        Tue, 03 Sep 2019 03:32:50 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id t123sm19799566wma.40.2019.09.03.03.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 03:32:49 -0700 (PDT)
Date:   Tue, 3 Sep 2019 11:32:48 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the kgdb-dt tree
Message-ID: <20190903103248.dvmylw5ewcvc5wvq@holly.lan>
References: <20190903071657.2caa0c46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903071657.2caa0c46@canb.auug.org.au>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 03, 2019 at 07:16:57AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   f12dc871e3ec ("kgdb: fix comment regarding static function")
>   c60d67aad7b7 ("kdb: Replace strncmp with str_has_prefix")
> 
> are missing a Signed-off-by from their committer.

Oops. Fixed!


Daniel.
