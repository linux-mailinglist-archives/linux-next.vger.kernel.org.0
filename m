Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59ADB1A85D1
	for <lists+linux-next@lfdr.de>; Tue, 14 Apr 2020 18:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440527AbgDNQtz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 14 Apr 2020 12:49:55 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:56361 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501951AbgDNQtu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2020 12:49:50 -0400
Received: from [192.168.1.183] ([37.4.249.171]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MAOeB-1jZdAL1lEJ-00Bw1n; Tue, 14 Apr 2020 18:49:34 +0200
Subject: Re: Coverity: mmal_setup_video_component(): Code maintainability
 issues
To:     coverity-bot <keescook@chromium.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
References: <202004140833.632892C8@keescook>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Openpgp: preference=signencrypt
Autocrypt: addr=stefan.wahren@i2se.com; keydata=
 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 AQ==
Message-ID: <dad3abd9-c890-eb7b-efa5-f662b096f78e@i2se.com>
Date:   Tue, 14 Apr 2020 18:49:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <202004140833.632892C8@keescook>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Provags-ID: V03:K1:0R6cj7E77qaLq3IS89zuWUpF+BMG+rH2swtRXyYfhgEaOPBqEk4
 NDt91UO0D9+p3hUEZqcUdo1vFIdYnOIFK3p2IGXuoo+ftAlffmapM63q0D/eV6qz4Cmj4Xd
 8gFHVyIdHUorbQy9mZjWiSDmQCCa4Xw5MnHJ3oT7m7ke/0ExRZmU4bF4JV8asFE+YJm3Mp8
 Bvg8uzuNPu7itPUvnJ/Pg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ysgSiAHHfAQ=:lZ/miOxQ7OBS0vo50SZOhp
 IR2Srir6xCIQ5yCXIaSnnDCGqLgec8mL8GuLDWLtms9aFRD7gTyBPtwJxP1zAI14Iu6UCMW6m
 sJEZcOULKtqkcrQKK/aRSKObB5vo4y4720eTl29okUqvnq5XDktVI9FdIhvr/NvBVcRidWYbw
 nnQk1gUE+yWpPsOcnPNq2ieFkk1vS3RNTw+4aa9ilMx4fv9x9tVTvYizCwzz5SW2N+vx+qWLD
 ScWVqVs+Qmljva0KS98FRbtM2fnyu+a8tII5lEjJRjuzEzJMyVxOlz5k/+bnhvSuE0UTtjntd
 emWpyuMV/H47G/M/XUsYBLmev9EF52Lg8rW4xbIN3RBY3RKWtkRXTfdQshSd45KIy4APki3oi
 89hZVX9VmKXrVaEtWwBvl38Qaa5+dsvEnW+S8DsUVd0OKWUeTWFRNdOS1mNX7rFNn18ZNfDvF
 B6dtmqMktb1y4/b/p78l6EhaEkjNelJryU+0YMautok9//6lFJEbp8/vr2FXqiTo2TsdhiUBl
 eUtjtxCttq8TUPKob0luUvhallYrKY4kiq7B1j6ALDic83srHQfIdMdeT6UX6+6Keh/VtmF2T
 nKBJyEZxaUutEpwAZP80i9/jZaVwxeQqEgQDyL86netl0KaSfc/XeC6CgPSNyXIi+blGLe9ec
 HCV6NykmXmaVy8/kyaxfAeRwjdrnKw+9XVAewKkmrmL69R4hfFl5+4UTYfMDWfOGPUMzm+j/i
 HFnxJg4cDecrneEFJYrfw/Q7gt25oj3rby4lRi3BPWghKEFiVvQj5U+97VRfzxcpLe742NlBz
 7FDJMCahcID8/RyoAONxOnbQhe+PgZeKAHJCzZPSpquYeHyhMgSzr+8tAd1rTBj0rS+xNxB
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Am 14.04.20 um 17:33 schrieb coverity-bot:
> Hello!
>
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20200414 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>
>   Sun Mar 29 14:44:58 2020 +0200
>     1a59532382a6 ("staging: bcm2835-camera: Move video component setup in its own function")
>
> Coverity reported the following:
>
> *** CID 1492591:  Code maintainability issues  (UNUSED_VALUE)
> /drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c: 1014 in mmal_setup_video_component()
> 1008     	if (overlay_enabled) {
> 1009     		/* Need to disable the overlay before we can update
> 1010     		 * the resolution
> 1011     		 */
> 1012     		ret = vchiq_mmal_port_disable(dev->instance, preview_port);
> 1013     		if (!ret) {
> vvv     CID 1492591:  Code maintainability issues  (UNUSED_VALUE)
> vvv     Assigning value from "vchiq_mmal_port_connect_tunnel(dev->instance, preview_port, NULL)" to "ret" here, but that stored value is overwritten before it can be used.
> 1014     			ret = vchiq_mmal_port_connect_tunnel(dev->instance,
> 1015     							     preview_port,
> 1016     							     NULL);
> 1017     		}
> 1018     	}
> 1019     	preview_port->es.video.width = f->fmt.pix.width;
>
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):

thanks for the report. The finding is correct, but the issue already
exists before. The intention of my patch was to increase readibility,
not to change the behavior.

My problem is that i'm not aware how to handle the error case here.

@Dave Should we bail out or ignore the error?

Best regards
Stefan

>
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1492591 ("Code maintainability issues")
> Fixes: 1a59532382a6 ("staging: bcm2835-camera: Move video component setup in its own function")
>
> Thanks for your attention!
>

