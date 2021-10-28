Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCF443DCDE
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 10:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhJ1ITk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 04:19:40 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:47946 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1ITk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 04:19:40 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 211432177B;
        Thu, 28 Oct 2021 08:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635409033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zqdN6Yjfc0XO6AHhq0eQB4f4yiJINc5vCkKCiBekK2M=;
        b=NgbGwfcr7oyJW7XwZ6TcRjr0SKAHialJKfeXWxWb6kmsx8zY6B+hXCxgILiQssu9G8KVxx
        MSqODr51OJ2U41JEKshfU/hMeWEwk17EFYkCcfEFiyb1/I2W3cwA+LSJx92M8tAcJ8jGkg
        wLAi7rUkQdfiAQbdbqngjA2m4avMU0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635409033;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zqdN6Yjfc0XO6AHhq0eQB4f4yiJINc5vCkKCiBekK2M=;
        b=XFBH3OHzK02GTqiMsYUPCMkwMUyAgNBwDdJ8soiJb7xH/nlmoSFp+zyuHa6cALbyWqRFh4
        H0ij0Izb7tpZ/pCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 109AA139BE;
        Thu, 28 Oct 2021 08:17:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id V2YJBIlcemGVMwAAMHmgww
        (envelope-from <bp@suse.de>); Thu, 28 Oct 2021 08:17:13 +0000
Date:   Thu, 28 Oct 2021 10:17:06 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <YXpcgoGzF4Sh3qs3@zn.tnic>
References: <20211025151144.552c60ca@canb.auug.org.au>
 <20211028161058.39c0d199@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211028161058.39c0d199@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, Oct 28, 2021 at 04:10:58PM +1100, Stephen Rothwell wrote:
> This build failure has returned today :-(

Sorry about that.

I had the original patch updated but then it is very possible I
fat-fingered the branch during the patch frenzy in the past days here.

Now I've applied yours because it happening a second time simply
warrants having this as a separate patch.

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
