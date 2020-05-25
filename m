Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A751E0C77
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 13:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390003AbgEYLH3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 07:07:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:42386 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389897AbgEYLH3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 May 2020 07:07:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 93A3BAD45;
        Mon, 25 May 2020 11:07:30 +0000 (UTC)
Date:   Mon, 25 May 2020 13:07:27 +0200 (CEST)
From:   Miroslav Benes <mbenes@suse.cz>
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for May 21 (objtool warnings)
In-Reply-To: <alpine.LSU.2.21.2005251101030.24984@pobox.suse.cz>
Message-ID: <alpine.LSU.2.21.2005251303430.24984@pobox.suse.cz>
References: <20200522001209.07c19400@canb.auug.org.au> <22332d9b-5e9f-5474-adac-9b3e39861aee@infradead.org> <alpine.LSU.2.21.2005251101030.24984@pobox.suse.cz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> I'll try to find out which optimization does this, because it is a 
> slightly different scenario than hiding __noreturn from the callees. 
> Probably -fno-ipa-pure-const again.

And it is indeed -fno-ipa-pure-const again.

Miroslav
