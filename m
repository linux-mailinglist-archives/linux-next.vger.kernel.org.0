Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A81E8C62
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 17:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390303AbfJ2QGB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 12:06:01 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34172 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390282AbfJ2QGB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 12:06:01 -0400
Received: by mail-pf1-f194.google.com with SMTP id b128so9922004pfa.1
        for <linux-next@vger.kernel.org>; Tue, 29 Oct 2019 09:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cGG06yt0bkkBP2tmdyO1XulQsFf34VxGUXM1xq1/epI=;
        b=fSZg99AsHbBWWsobZmhgJDTCrwmxVUvEgHnCs3MIrKNxTbab1dfhA5i7GmC/FaBoVb
         rkup91elyoaiirMt6/10sUqdyTTAB9LTS0++74qyNzkYOzBU7pJihMPhPij8cSr5hhXb
         jxJ+uUTGbHbjp/VfBTRnbdVyLz/1/z0CnjEnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cGG06yt0bkkBP2tmdyO1XulQsFf34VxGUXM1xq1/epI=;
        b=tSZ5jzzXkzM2WlQSsL2vkO/keBIOQNAG4HQR8Q2t6fnZFhzqosX6BOiivJK+cpcWTy
         gjT7N+dDDMayDUC0U7QRMq5nZ0/A45283KDiX5h/RAu1mhX4B9lcmCnUgqMk9ANNEa8r
         tX/ZB2QvQ19IFaLsnNMzFBms+c6eDMwTEgg9998P7CRRpG8gUD5gnKur+J38EkDvwhBs
         4m0GAEEHtZXk0KH4T8w9ZTk8rnv00Fvc4ILFpzibOCid92g/8k7RUgu37IafPw12BTtB
         APC5gsBesm+7nicIIgtJtMD+mMEH+YMdUqUGh7sgI9hm3ZaCIw3iz1fitpEyqT0krcdT
         31mQ==
X-Gm-Message-State: APjAAAXN1+CPpOTD86k4WyrYAwQFBznUUCCADzXdWSZ38i72P9mQG2ok
        KBjWJ2Z/x2fw1xq5GXXHTgPe2A==
X-Google-Smtp-Source: APXvYqzwr6SUmtBD7W7qqVi6rMkpfDREV2Dq9nb8thrfh/K0V8SaEVQj5zfuwcVKCIgs4t65QUuPHg==
X-Received: by 2002:a17:90a:d588:: with SMTP id v8mr7540626pju.51.1572365160901;
        Tue, 29 Oct 2019 09:06:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o7sm309700pjo.7.2019.10.29.09.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:05:59 -0700 (PDT)
Date:   Tue, 29 Oct 2019 09:05:59 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Tudor.Ambarus@microchip.com
Cc:     boris.brezillon@collabora.com, gustavo@embeddedor.com,
        linux-next@vger.kernel.org
Subject: Re: Coverity: spi_nor_erase_sector(): Null pointer dereferences
Message-ID: <201910290905.EE39EBC6@keescook>
References: <201910281605.9E90B64E86@keescook>
 <c1fae93d-ea1c-ace1-28d9-00ac558129c4@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1fae93d-ea1c-ace1-28d9-00ac558129c4@microchip.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 29, 2019 at 05:59:04AM +0000, Tudor.Ambarus@microchip.com wrote:
> Hi. Thanks for the report!
> 
> On 10/29/2019 01:05 AM, coverity-bot wrote:
> > External E-Mail
> > 
> > 
> > Hello!
> > 
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191025 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> > 
> > 453977875364 ("mtd: spi-nor: Introduce 'struct spi_nor_controller_ops'")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1487363:  Null pointer dereferences  (FORWARD_NULL)
> > /drivers/mtd/spi-nor/spi-nor.c: 967 in spi_nor_erase_sector()
> > 961     	 */
> > 962     	for (i = nor->addr_width - 1; i >= 0; i--) {
> > 963     		nor->bouncebuf[i] = addr & 0xff;
> > 964     		addr >>= 8;
> > 965     	}
> > 966
> > vvv     CID 1487363:  Null pointer dereferences  (FORWARD_NULL)
> > vvv     Dereferencing null pointer "nor->controller_ops".
> > 967     	return nor->controller_ops->write_reg(nor, nor->erase_opcode,
> > 968     					      nor->bouncebuf, nor->addr_width);
> > 969     }
> > 970
> > 971     /**
> > 972      * spi_nor_div_by_erase_size() - calculate remainder and update new dividend
> > 
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include:
> 
> It's a false positive, but the bug report helped us improve the code. I received
> similar report with smatch, see the discussion here:
> https://www.spinics.net/lists/linux-mtd/msg09701.html

Okay, great! The Coverity scan tends to be a little behind, so apologies
for the duplicate report. :) Thanks for checking!

-- 
Kees Cook
