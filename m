Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12CF65FD3E5
	for <lists+linux-next@lfdr.de>; Thu, 13 Oct 2022 06:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiJMEnW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Oct 2022 00:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiJMEnU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Oct 2022 00:43:20 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F91115412
        for <linux-next@vger.kernel.org>; Wed, 12 Oct 2022 21:43:19 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id k9so371449pll.11
        for <linux-next@vger.kernel.org>; Wed, 12 Oct 2022 21:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JsHC8swQSZ5Fh6XAG3L1qnH+ruxn+bGz4WF3nlLiN14=;
        b=rBIFU4eRo/WpDg/QEh2oJxLGHZQB9RyNylwSEeOmWfhmViWkXHPnzgt/ooxvQxMAdB
         4W2jp6szEyHadTa3hJSosN09WQZEQc0IrUW8Sk/Z+FX4YQrACflpk8kBbzXMMz7rXFUE
         TR9LRp1pI/NezJm76CcNgizpKkFgBNXpYcTO/jXG+8f9dGkq4Fs6ki3Nz3zhULbKe5cW
         r78h5BfBMwBwvrre2/Bg0mWlECKuTreAMREvAChPAfdB9/cDzVqQmeTOwZJ46754QNiP
         f9Eq3xnYy03TPYl5CYuzv0q6sO26Ix2HgHqLv1VUAVE1VFNE3WrCRZjsBtm2MzOMDLQP
         +lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsHC8swQSZ5Fh6XAG3L1qnH+ruxn+bGz4WF3nlLiN14=;
        b=knMsAA0FWwRLqzQBZb1zk/b/4sSAxfSgaYo3P0Cormdi9aVZ8BtYVZ1WEXIiWzeTcw
         IidmjOzLjkVzSNBSGW/Y1nzLOeLASBgW6MALb946hjOS1VFkld9Dk/3zQMxkrVR7i5P/
         nWjPci4whi7onxgdg2d4V7y58M7dEnjzMWsPb7NJZkyrm6Kl5c1V35zomiWPE9drJK03
         +nhHkunEMQSC81Oh7SVz4vP7RwxRFcYO5+rK0Ffz50/9GxFUo0Qu1hPyfiRwWNTO7jF7
         fswh0lODCoBiltmOI1Q8vt/s5ALZJ2lU3Vg7evUATPxjc8ohrbNuyR+uTYafyEuYRbVk
         cd7A==
X-Gm-Message-State: ACrzQf3DVVOV3mR0PgEHyrq1dL+bhJIP3aZFfUWaqA1pwXJ4iRLY8R2t
        zqG2pCRgADuQL+a1VHEObKj48GTuZZZtRQ==
X-Google-Smtp-Source: AMsMyM5XRtwhaYB95jGH35Dz5kPov+mIJZSO8TpKLW4k/dJ2ZMmZudjH0qpr+vXhFbRgPhkDeVK6pw==
X-Received: by 2002:a17:90a:5308:b0:20b:1eae:c94e with SMTP id x8-20020a17090a530800b0020b1eaec94emr9018473pjh.88.1665636198670;
        Wed, 12 Oct 2022 21:43:18 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id w68-20020a626247000000b00537eacc8fa6sm782238pfb.40.2022.10.12.21.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:43:17 -0700 (PDT)
Date:   Thu, 13 Oct 2022 04:43:13 +0000
From:   Carlos Llamas <cmllamas@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the mm-stable
 tree
Message-ID: <Y0eXYYG4FXbdNbYO@google.com>
References: <20221013104234.11e88852@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013104234.11e88852@canb.auug.org.au>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 13, 2022 at 10:42:34AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   db24ef4e6b0a ("mm/mmap: undo ->mmap() when arch_validate_flags() fails")
> 
> is missing a Signed-off-by from its author.
> 
> -- 
> Cheers,
> Stephen Rothwell

Sorry this was my fault as I used a three-dash line to comment a code
section in the commit message. Which instead just cuts the commit log
short when applying the patch. Sigh.

You can see this in the original post:
https://lkml.kernel.org/r/20220930003844.1210987-1-cmllamas@google.com

I believe Andrew noticed this error and fixed the patch. However, the
Signed-off-by tag probably got dropped in the process. I'm unsure if
this can be amended in the mm tree?

Thanks Stephen for flagging this and apologies Andrew for the trouble.

--
Carlos Llamas
