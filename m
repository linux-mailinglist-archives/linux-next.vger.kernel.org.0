Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF893AE112
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 01:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhFTXMD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Jun 2021 19:12:03 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:47052 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhFTXMC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 20 Jun 2021 19:12:02 -0400
Received: by mail-wr1-f53.google.com with SMTP id a11so17477514wrt.13;
        Sun, 20 Jun 2021 16:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QqweIxdIU8VZggzKpTR6wXR6FTUbL29z9hu1zISg3lk=;
        b=sl4AXIUg4wu3I5bWrF+2IblhVUAHDWmOJRwWfIsK2J8p2Nl91NYQGv28/XNjXDIvF5
         AV+sTecM7vwoH/mVmBPMNkJSawpQJpE6Lv7T4hfHyxgEwt9EyxZp+fint1tSqhmx76AY
         JGJVM4VqxGV0Lv9tGkTEuvqXAWa5nC1Ns8ULtfCRpVOdTKBCYRw9RJWKbWmkWTMO0Hoo
         vIOveKr14vrZxjWzqqf7x7qRnF2j3LR8ItzQxmnEIyNPxsesrx1diy+ofjxomKOPVx6e
         5PdLdOYCVFdM+cXpAOMmSBIcGn5ZuctZ3akkhV0/n/bsLIvbw90md801JeBRZJdwQ3xz
         cibQ==
X-Gm-Message-State: AOAM530u4ZHN/g4j90vKjkMdiZmcBvK9hO1QyGz4IBqxTSwQDeWmOtsy
        kSxgwTKEfpN5X3Y2+yPscQFxeNcxPuM=
X-Google-Smtp-Source: ABdhPJxl+3QNCqz3xbXXz0oDAwhsX9PGqIWp2SxDSlvhxth+OeXhq2dIUmwzVuOkYggsvtrAJO5oeg==
X-Received: by 2002:adf:f688:: with SMTP id v8mr11362429wrp.209.1624230587646;
        Sun, 20 Jun 2021 16:09:47 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id n8sm2455072wmc.45.2021.06.20.16.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 16:09:47 -0700 (PDT)
Date:   Sun, 20 Jun 2021 23:09:45 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wei Liu <wei.liu@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the hyperv tree
Message-ID: <20210620230945.t4u7rxyxcot5re5y@liuwe-devbox-debian-v2>
References: <20210621085548.35b6f88c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621085548.35b6f88c@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 21, 2021 at 08:55:48AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   13d5ac4c5a3d ("PCI: hv: Add check for hyperv_initialized in init_hv_pci_drv()")
> 
> is missing a Signed-off-by from its committer.

This is fixed. Thanks.

> 
> -- 
> Cheers,
> Stephen Rothwell


