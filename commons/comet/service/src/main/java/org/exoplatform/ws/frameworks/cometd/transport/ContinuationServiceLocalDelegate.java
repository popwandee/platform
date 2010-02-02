/*
 * Copyright (C) 2003-2008 eXo Platform SAS.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Affero General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see<http://www.gnu.org/licenses/>.
 */
package org.exoplatform.ws.frameworks.cometd.transport;

import org.exoplatform.services.log.Log;
import org.exoplatform.container.ExoContainer;
import org.exoplatform.container.ExoContainerContext;
import org.exoplatform.container.RootContainer;
import org.exoplatform.services.log.ExoLogger;
import org.exoplatform.ws.frameworks.cometd.ContinuationService;

/**
 * Created by The eXo Platform SAS.
 * 
 * @author <a href="mailto:vitaly.parfonov@gmail.com">Vitaly Parfonov</a>
 * @version $Id: $
 */
public class ContinuationServiceLocalDelegate
   implements ContinuationServiceDelegate
{

   private final ContinuationService continuation;

   public ContinuationServiceLocalDelegate(ContinuationService continuationService)
   {
      continuation = continuationService;
   }

   /**
    * {@inheritDoc}
    */
   public Boolean isSubscribed(String exoID, String channel)
   {
      return continuation.isSubscribe(exoID, channel);
   }

   /**
    * {@inheritDoc}
    */
   public void sendMessage(String exoId, String channel, String message, String msgId)
   {
      continuation.sendMessage(exoId, channel, message, msgId);
   }

   /**
    * {@inheritDoc}
    */
   public void sendBroadcastMessage(String channel, String message, String msgId)
   {
      continuation.sendBroadcastMessage(channel, message, msgId);
   }

}
