Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 427D1B573A
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 22:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729981AbfIQU4C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 16:56:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:47356 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729974AbfIQU4C (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Sep 2019 16:56:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 824D7ABF4;
        Tue, 17 Sep 2019 20:56:00 +0000 (UTC)
Date:   Tue, 17 Sep 2019 22:56:00 +0200
Message-ID: <s5h8sqmtzfj.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     Jaroslav Kysela <perex@perex.cz>,
        Mac Chiang <mac.chiang@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: Build failure after merge of the sound-current
In-Reply-To: <20190917195722.GG3524@sirena.co.uk>
References: <20190917103858.GA3524@sirena.co.uk>
        <20190917195722.GG3524@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 17 Sep 2019 21:57:23 +0200,
Mark Brown wrote:
> 
> On Tue, Sep 17, 2019 at 11:38:58AM +0100, Mark Brown wrote:
> 
> > IIRC there was some previous discussion of a dependency on other changes
> > here but I thought that was resolved?  I've reverted that commit for
> > today.
> 
> This wasn't resolved, Stephen's been carrying a patch for it in -next.
> I didn't see this mentioned in the pull request for sound to Linus...
> might be an issue if it gets pulled before tip.

Hm, strange, I couldn't get the warning when I tested allyesconfig on
the tree merged onto 5.3...


Takashi
