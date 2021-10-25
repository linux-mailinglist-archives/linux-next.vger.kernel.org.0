Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E35643918F
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 10:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhJYIkT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 04:40:19 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:47502 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbhJYIkR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 04:40:17 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 266EB1FCA3;
        Mon, 25 Oct 2021 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635151075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4dls5uRlACSvDq7656bxhDPR0TaCu5wrq7ETsKfcGPU=;
        b=V7DG4CspT03IBg1h9W6/tafyAbj/eSoP7elTl9QrKU1cFm+Ee3IWAsJl4+DTqWSK+PTYBs
        2BXoPmDpp+nIYtJR8NC8KW5j6yS3E+TZ0jpV18sc6w8K6vIS3M1ZkO7pa7stkbLw25ts9X
        umQe9R7HsxNuajaWLd9Xtlwts0gjpUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635151075;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4dls5uRlACSvDq7656bxhDPR0TaCu5wrq7ETsKfcGPU=;
        b=ipnqveiOS1vnSsDlT8qjiVTXxEGxBWQ95igsGbq/Wx8gVjUPKG5JptliomCts1osWiTm/4
        Llayibztvj3iK+DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13F5D13216;
        Mon, 25 Oct 2021 08:37:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id dexBBONsdmG7LgAAMHmgww
        (envelope-from <bp@suse.de>); Mon, 25 Oct 2021 08:37:55 +0000
Date:   Mon, 25 Oct 2021 10:37:52 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <YXZs4IXzixtmvTYA@zn.tnic>
References: <20211025151144.552c60ca@canb.auug.org.au>
 <YXZf1KAgWobGNO5a@zn.tnic>
 <20211025185836.0df72e58@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211025185836.0df72e58@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 25, 2021 at 06:58:36PM +1100, Stephen Rothwell wrote:
> That will certainly make it more robust against people cleaning up
> include files.

Ok, rebased and pushed out. You could try it now.

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
