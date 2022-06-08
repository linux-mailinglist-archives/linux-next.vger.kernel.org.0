Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7704542944
	for <lists+linux-next@lfdr.de>; Wed,  8 Jun 2022 10:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiFHIWM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jun 2022 04:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiFHIVC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jun 2022 04:21:02 -0400
X-Greylist: delayed 992 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 08 Jun 2022 00:48:06 PDT
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [IPv6:2a02:9e0:8000::27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07473A7BC0
        for <linux-next@vger.kernel.org>; Wed,  8 Jun 2022 00:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protonic.nl; s=202111;
        h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
         message-id:subject:cc:to:from:date:from;
        bh=RV0K8tpzbELGoq/3nZpoMyX+LVp9/7bjBCndaBlBuYE=;
        b=asUwWPOhOIdmjUYy/mZBNfzUBYLnGNE1dujOIClpkt0IkZ2kzvb5Sxqr/86gpOsXyylvcIwgZn8nf
         rAvzWL4sCqFzZrbx2wfD23wxsVnxY4Pvq7oMYcy9YENQrwvycr1+SMiXlUyDPhKR31550p8WLpnsPc
         UA5YE9DH/PO9K3hvNP8ccx7rbCWBf4AFXrnLVtWF7a9eszwAx1euA09faQj/8c+mNrLYEA5hoIMvdt
         Mgd1DDL9dVtu/CW5kv1xPYcf+I4qVuhjZlhdRwMqtlQrZpMQIbeuRxo1bUIe25fMinn2N3Ynn4h0Zy
         HhDI5h0PSZGrenHC7YqlgWTkO4TPXzg==
X-MSG-ID: ed1c1e71-e6fc-11ec-9896-0050569d2c73
Date:   Wed, 8 Jun 2022 09:30:52 +0200
From:   David Jander <david@protonic.nl>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the spi tree
Message-ID: <20220608093052.34e919e3@erd992>
In-Reply-To: <20220608143038.0ef8365b@canb.auug.org.au>
References: <20220608143038.0ef8365b@canb.auug.org.au>
Organization: Protonic Holland
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Hi Mark, Stephen,

On Wed, 8 Jun 2022 14:30:38 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the spi tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> include/linux/spi/spi.h:82: warning: Function parameter or member 'syncp' not described in 'spi_statistics'
> include/linux/spi/spi.h:213: warning: Function parameter or member 'pcpu_statistics' not described in 'spi_device'
> include/linux/spi/spi.h:676: warning: Function parameter or member 'pcpu_statistics' not described in 'spi_controller'
> 
> Introduced by commit
> 
>   6598b91b5ac3 ("spi: spi.c: Convert statistics to per-cpu u64_stats_t")
> 

This is my fault. @Mark: Should/must I do something about this now that it
already hit the next tree? How to proceed?

Best regards,

-- 
David Jander
