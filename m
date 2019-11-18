Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A765100D40
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 21:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfKRUqf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 15:46:35 -0500
Received: from mail-pg1-f174.google.com ([209.85.215.174]:39210 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbfKRUqf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Nov 2019 15:46:35 -0500
Received: by mail-pg1-f174.google.com with SMTP id 29so10186095pgm.6
        for <linux-next@vger.kernel.org>; Mon, 18 Nov 2019 12:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ra+V594g4GxGUf2p94uZsDJ5tcF60n9sPVq5iKUyjHo=;
        b=X6PXKnQkdjEkvbl2KWhv3Naso+kfESaYkH78Av5BAS1tfGmYgeSkEE5aqWEQNg8pN6
         CkeG2duYN3o5aSlqyKARdR8OHs2ijz7GWsWUCJwF7rRCFcNfKuevPiuwpTWezRyQpaY9
         dNus8VsF1/ZaeMgcYe421+wRLgt3OUlLgSNec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ra+V594g4GxGUf2p94uZsDJ5tcF60n9sPVq5iKUyjHo=;
        b=qQgzbr0O0oLujPD3OiQOmYZEjZqrh3meo7XO1+DQPf/ZDqvLvQgGIADoQ4fMD2REZm
         vKfAFDLCnUb95kOP9x0B9QW3ZGdlXBTdC6FJmAWnkd1IJrXIpduZ0/mfk6cF/aWLTO8t
         XWLEkbpGa0AA/nQU8nba+JpMjtFQmqLyq+egoUn2HWwdkLggUHJA8iMpk7wnujIYpaFA
         l0N+92SyXaabhtxgDQ6nzTqBIcoouuLlq3SE266vuTj1M8HTPzGwF+CR997Roe5xAuLV
         jd8HV4cduNWvnKb1OriuTzu+gHKWL/Yf9/TQ3j3hP8M5IlkE9MIBYp9amOlkN/rrTBec
         bq8w==
X-Gm-Message-State: APjAAAXWPwXOFW6yKsII8sN8tTvw0WDQEjz7f/SAskZzC4eGGQSwkg3W
        /JKfiay9Tn//ufZoa0pbNDm2nw==
X-Google-Smtp-Source: APXvYqzycpcsZ25dopaRtGovgTbp2t2vGPfst4Zi/GLF1bEhnv18JNikrCLa94RJazhz/XzP/nszgA==
X-Received: by 2002:a63:af1a:: with SMTP id w26mr1375140pge.251.1574109994193;
        Mon, 18 Nov 2019 12:46:34 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g7sm21374265pgr.52.2019.11.18.12.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 12:46:33 -0800 (PST)
Date:   Mon, 18 Nov 2019 12:46:32 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jens Axboe <axboe@kernel.dk>,
        Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: blkdev_zone_mgmt(): Memory - illegal accesses
Message-ID: <201911181233.A2AB6617E@keescook>
References: <201911111735.3EA3258CBC@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911111735.3EA3258CBC@keescook>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 11, 2019 at 05:35:00PM -0800, coverity-bot wrote:
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191108 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> a2d6b3a2d390 ("block: Improve zone reset execution")
> 
> Coverity reported the following:
> 
> *** CID 1487849:  Memory - illegal accesses  (USE_AFTER_FREE)
> /block/blk-zoned.c: 293 in blkdev_zone_mgmt()
> 287
> 288     		/* This may take a while, so be nice to others */
> 289     		cond_resched();
> 290     	}
> 291
> 292     	ret = submit_bio_wait(bio);
> vvv     CID 1487849:  Memory - illegal accesses  (USE_AFTER_FREE)
> vvv     Calling "bio_put" dereferences freed pointer "bio".
> 293     	bio_put(bio);

I don't know this area of the code very well, but looking through the
helpers here, it does seem like "bio" gets (or can be) freed before
returning from submit_bio_wait() (regardless to what the comment
says):

submit_bio_wait()
  submit_bio()
    generic_make_request()
      generic_make_request_check()
        bio_endio()
          __bio_chain_endio()
            bio_put()

The path passes into some error handling here, but it does seem like it
could be possible to hit both bio_put()s?

Can anyone speak to this?

-Kees

> 294
> 295     	return ret;
> 296     }
> 297     EXPORT_SYMBOL_GPL(blkdev_zone_mgmt);
> 298
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487849 ("Memory - illegal accesses")
> Fixes: a2d6b3a2d390 ("block: Improve zone reset execution")
> 
> 
> Thanks for your attention!
> 
> -- 
> Coverity-bot

-- 
Kees Cook
