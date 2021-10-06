Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41A6423B21
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 11:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhJFJ6S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 05:58:18 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:60264 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhJFJ6Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 05:58:16 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8649020349;
        Wed,  6 Oct 2021 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1633514183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3L5N3fehICC6g2ndAXooovCCqlbZExX6ZHId9I7luWk=;
        b=ESdjf4RfULucI78UpRcoYUmFrJL+gNdV5T1xw9dBM0sgauZYS7og9llXgKkRjX+9Cktvhk
        H7+OTpHCJ8eHyrN1czNlSt6dEv5xQKMYnHfq2oWPcNfBte38wLZGb7s4jhb6aWhGT0UsgB
        9sYVmVV3vob6Y7Mo4jgP6KkILg10ROU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1633514183;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3L5N3fehICC6g2ndAXooovCCqlbZExX6ZHId9I7luWk=;
        b=zUfyd/YMGPbbwXnjLmUYAt3IVzUh2LGbki8LrL1LeKBPXfy3bkejGqjtAXsTa4daX8g/h5
        va/brW5gi2ez/CCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75FE213B73;
        Wed,  6 Oct 2021 09:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id fL2zHMdyXWHIXwAAMHmgww
        (envelope-from <bp@suse.de>); Wed, 06 Oct 2021 09:56:23 +0000
Date:   Wed, 6 Oct 2021 11:56:15 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <YV1yvwWkLXlmcyWm@zn.tnic>
References: <20211006135826.3e1783f1@canb.auug.org.au>
 <YV1s1GJ+e/qASPy7@zn.tnic>
 <20211006205444.52e088a9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211006205444.52e088a9@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, Oct 06, 2021 at 08:54:44PM +1100, Stephen Rothwell wrote:
> Works for me, thanks.
> 
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # ppc64le compile

Thx!

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
