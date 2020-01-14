Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0587313B46A
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 22:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgANVds (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jan 2020 16:33:48 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:49648 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726491AbgANVds (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jan 2020 16:33:48 -0500
Received: from callcc.thunk.org (guestnat-104-133-0-108.corp.google.com [104.133.0.108] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 00ELXXC9023515
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Jan 2020 16:33:34 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 095E24207DF; Tue, 14 Jan 2020 16:33:33 -0500 (EST)
Date:   Tue, 14 Jan 2020 16:33:32 -0500
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Qian Cai <cai@lca.pw>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the random tree
Message-ID: <20200114213332.GF140865@mit.edu>
References: <20200108113953.1a92a90f@canb.auug.org.au>
 <20200114001832.GP76141@mit.edu>
 <20200114012221.GC202391@google.com>
 <20200114165739.GB140865@mit.edu>
 <613F42EB-F993-4F39-AD9B-A86E06A875AA@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <613F42EB-F993-4F39-AD9B-A86E06A875AA@lca.pw>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 14, 2020 at 12:31:04PM -0500, Qian Cai wrote:
> It is actually Sergey proposed an informal patch here [1]. I just sent on
> his behave and adding a commit log.
> 
> [1] https://lore.kernel.org/linux-mm/20190911011008.GA4420@jagdpanzerIV/ 
> 

Thanks for the clarification; given that you composed the commit log,
would you like me to add a "Signed-off-by: Qian Cai <cai@lca.pw>" for
you as well?  Given that you added the commit description, it would be
fair to give you credit as well.

Regards,

					- Ted
