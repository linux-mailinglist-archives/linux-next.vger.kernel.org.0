Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A0E66AAE1
	for <lists+linux-next@lfdr.de>; Sat, 14 Jan 2023 11:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjANKOi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 14 Jan 2023 05:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjANKOh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 14 Jan 2023 05:14:37 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A8676BD
        for <linux-next@vger.kernel.org>; Sat, 14 Jan 2023 02:14:36 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id k18so1780470pll.5
        for <linux-next@vger.kernel.org>; Sat, 14 Jan 2023 02:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z7++H4V6hNi27Aju7rRR2cyddaE4xHSSiZpHf+T0Adk=;
        b=mV7xtcEZZKXbUW9dgq8/GV7se/rEBkykyqaKRNHFY4Fmq7YnxLKKgkT3XlWlkOkSEi
         DdPH/RI2Co1aDZiw/v8Q1E7d0wNYORp4D4T3ZgOBbbh6EmIeh2M2H5W3hD0VbFY0KXMj
         NS+QI/p/J33e46oq+trhdZYGCLOtLmR+elU50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7++H4V6hNi27Aju7rRR2cyddaE4xHSSiZpHf+T0Adk=;
        b=xiQaAUeIv5TYEr2oF2SnXJWwQbjuSNdFjhqXkchDzqIOnqlgKLwV0+tqnDM563A3uT
         xXlRVOr7+6Oc3144BzsgaOxg67fll7ErZMYpcCmlxu2Fe/kfKU4XASAIy3hQnBpxPn0n
         9289kBu2tgsByUJ3ObXh7DrYr7bpdoRAhRqXixZaNdRk9tsVH8ScwxCFY9Zqd9InJFhJ
         N/6Asbb2D78Ni5K9LSEb6AczyW+qeCj0h1Ty0+x45a4AEbpKjNTCUj3bLozlKXcBDnas
         cNCnCAt15235Ug4nVUgwUSNXykNNm2HeY4fB8rcF9YdBS6sLRAiQ8FtiCg4XGDjhfOnt
         0WhA==
X-Gm-Message-State: AFqh2koddeMXzs2E4ZrRZ1sLFyXDV0EBuxrM5R5CPlZgs1i79XecAg9Y
        xIqogGAvyUvu1wavnGNb+SLd4g==
X-Google-Smtp-Source: AMrXdXtXwPkUnAblauTv78rZKUdr5wdyNH1Crp8gEXe/df4QYLpoj9xzenEXGfjU4C4oV+m6JdfFnQ==
X-Received: by 2002:a17:902:a5c1:b0:191:1729:d7e7 with SMTP id t1-20020a170902a5c100b001911729d7e7mr87541846plq.67.1673691275745;
        Sat, 14 Jan 2023 02:14:35 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id n13-20020a170903110d00b001925ec4664esm15604019plh.172.2023.01.14.02.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 02:14:35 -0800 (PST)
Date:   Sat, 14 Jan 2023 19:14:29 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     coverity-bot <keescook@chromium.org>
Cc:     John Ogness <john.ogness@linutronix.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: console_prepend_dropped(): Memory - corruptions
Message-ID: <Y8KAhaiZQOWTcfyF@google.com>
References: <202301131544.D9E804CCD@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301131544.D9E804CCD@keescook>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (23/01/13 15:46), coverity-bot wrote:
> *** CID 1530570:  Memory - corruptions  (OVERRUN)
> kernel/printk/printk.c:2738 in console_prepend_dropped()
> 2732     		/* Truncate the message, but keep it terminated. */
> 2733     		pmsg->outbuf_len = outbuf_sz - (len + 1);
> 2734     		outbuf[pmsg->outbuf_len] = 0;
> 2735     	}
> 2736
> 2737     	memmove(outbuf + len, outbuf, pmsg->outbuf_len + 1);
> vvv     CID 1530570:  Memory - corruptions  (OVERRUN)
> vvv     Overrunning buffer pointed to by "scratchbuf" of 1024 bytes by passing it to a function which accesses it at byte offset 1998 using argument "len" (which evaluates to 1999). [Note: The source code implementation of the function has been overridden by a builtin model.]
> 2738     	memcpy(outbuf, scratchbuf, len);
> 2739     	pmsg->outbuf_len += len;
> 2740     }
> 2741     #else
> 2742     #define console_prepend_dropped(pmsg, dropped)
> 2743     #endif /* CONFIG_PRINTK */
[..]
> Human notes from Kees:
> 
> I'm not sure how it got 1998, but I do see that snprintf() should
> probably be scnprintf(), otherwise "len" might be a lie (i.e. it'll hold
> what it WANTED to write, rather than what it actually wrote).

Cannot imagine how "** %lu printk messages dropped **\n" can expand into
1998 bytes. Does coverity have a "verbose" mode?
