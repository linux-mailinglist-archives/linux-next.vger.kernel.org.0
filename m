Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4298643E16F
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 14:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhJ1NBc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 09:01:32 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:60252 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhJ1NBc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 09:01:32 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 39675212C9;
        Thu, 28 Oct 2021 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635425944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MBfQdZfMmLNO0jMthBAt+lb0E0lH+x5RMf8VhWZdRlQ=;
        b=g26/DtPLkHKqligwE4Tl6Akr83t0quaq0Kt6prTTxFHo5kqkwQBh1rN8rOmRU45B0PWKGA
        UqLkjvoMX09njD8Tna3fEMJRv9D5uDKrqc3DHLDreFmq80T33PcQf6hnOr78lg/8PaHpga
        O+xvWKx+QTevnIsrgC4ElJ2kDD8aEas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635425944;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MBfQdZfMmLNO0jMthBAt+lb0E0lH+x5RMf8VhWZdRlQ=;
        b=hDbvKlhXA3NQuzRPyypLrxkvDIaDG53YS3C3OrCaKXkwXYcV1lZec3T16PIbCciuB/h3Vm
        zbj76F+KP64JanCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28C1C13F14;
        Thu, 28 Oct 2021 12:59:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id iabtCZieemG2cgAAMHmgww
        (envelope-from <bp@suse.de>); Thu, 28 Oct 2021 12:59:04 +0000
Date:   Thu, 28 Oct 2021 14:58:59 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <YXqekxadmoKZJPW/@zn.tnic>
References: <20211028232651.31c01c86@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211028232651.31c01c86@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 28, 2021 at 11:26:51PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/x86/xstate.rst:15: WARNING: Title underline too short.
> 
> Using dynamically enabled XSTATE features in user space applications
> -------------------------------------------------------------------
> 
> Introduced by commit
> 
>   93175ec299f8 ("Documentation/x86: Add documentation for using dynamic XSTATE features")

The one time I don't run htmldocs on a documentation patch. ;-\

Thx for reporting, fixed.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
